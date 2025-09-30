KUBE_VIP=192.168.0.200
# Par défaut, on appelle la cible "help"
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make tf       		- Apply terraform"
	@echo "  make tf-destroy    - Destroy terraform units"
	@echo "  make ks      		- Launch ks"
	@echo "  make ks-clean      - Clean ks"

.PHONY: tf
tf:
	@$(MAKE) -C terraform terraform-apply

.PHONY: tf-destroy
tf-destroy:
	@$(MAKE) -C terraform terraform-destroy

.PHONY: ks
ks:
	@$(MAKE) -C kubespray kubespray

.PHONY: ks-clean
ks-clean:
	@$(MAKE) -C kubespray kubespray-clean

setup-kubectl:
	@ssh-keygen -f "/home/zeta/.ssh/known_hosts" -R "$(KUBE_VIP)"
	@ssh ubuntu@$(KUBE_VIP) "sudo cp /etc/kubernetes/admin.conf /tmp/; sudo chmod 775 /tmp/admin.conf"
	@scp ubuntu@$(KUBE_VIP):/tmp/admin.conf ~/.kube/config

get-argocd-passwd:
	@kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 --decode | xclip -sel clipboard

.PHONY: cluster-reset
cluster-reset: tf-destroy tf ks ks-clean
