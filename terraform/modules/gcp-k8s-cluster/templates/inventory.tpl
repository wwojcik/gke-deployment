
[all]
${connection_strings_master}
${connection_strings_node}

[kube_control_plane]
${list_master}

[etcd]
${list_master}

[kube_node]
${list_node}

[calico_rr]

[k8s_cluster:children]
kube_node
kube_control_plane
calico_rr

[k8s_cluster:vars]
${elb_api_fqdn}
