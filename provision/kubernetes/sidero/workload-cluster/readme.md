patch control plane nodes

machine
  files:
    - content: |
        [plugins."io.containerd.grpc.v1.cri"]
          enable_unprivileged_ports = true
          enable_unprivileged_icmp = true
      path: /etc/cri/conf.d/allow-unpriv-ports.toml
      op: create
