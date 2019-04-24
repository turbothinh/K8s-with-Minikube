# Local K8s with Minikube and Hyperkit

This project is to quickly create a K8s cluster on local machine with Minikube.

Note: This instruction is on Mac OS

## App structure
- `client/`: A copy of [React Minimal Boilerplate](https://github.com/turbothinh/React-ES6-Minimal-Boilerplate)
- `server/`: Simple Node Restful API

## Prerequisite
- Homebrew installed
- Hypervisor installed (Virtualbox, Hyperkit, etc.)

## Get started

1. Install `kubectl` and `Hyperkit` with `Homebrew`  
   ```brew install kubernetes-cli hyperkit && kubectl version```
   
2. Install [Minikube](https://github.com/kubernetes/minikube) with `Homebrew`  
   ```brew cask install minikube```

3. Set Minikube driver to `Hyperkit` (default is `Virtualbox`)  
   `minikube config set vm-driver hyperkit`

4. Create a Minikube node and enable Ingress  
   ```minikube start```

5. Enable Ingress Add-on for Minikube  
   ```minikube addons enable ingress```

6. Clone this repo  
   ```git clone git@github.com:turbothinh/K8s-with-Minikube.git && cd K8s-with-Minikube```

7. Create objects in the cluster  
   ```kubectl apply -f k8s```

8. Enable Ingress-nginx service  
   ```kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml```

9.  Check if everything is working correctly using Minikube dashboard  
   ```minikube dashboard```

11. Connect to the exposed services: `client` and `server`  
    * First get **Minikube IP** by running `minikube ip`
    * Copy the IP and paste to browser to visit `client`
    * Append `/api` to the IP on browser to visit `server`

Walla!
    
