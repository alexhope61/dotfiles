import asyncio

import iterm2


async def main(connection):
    component = iterm2.StatusBarComponent(
        short_description='kubectl context',
        detailed_description='The currently configured Kubernetes context for kubectl',
        exemplar='⎈ docker-for-desktop',
        update_cadence=2,
        identifier='engineering.dane.iterm-components.kubectl-context',
        knobs=[],
    )

    @iterm2.StatusBarRPC
    async def kubectl_context_coroutine(knobs):
        proc = await asyncio.create_subprocess_shell(
            'kubectl config current-context',
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
        )
        stdout, stderr = await proc.communicate()
        return f'⎈ {stdout.decode().strip()}' if not stderr else '⎈ kubectl not installed'

    await component.async_register(connection, kubectl_context_coroutine)

iterm2.run_forever(main)

# KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
# KUBENAMESPACE=$(NS=$(kubectl config view --minify --output=jsonpath="{..namespace}") 2> /dev/null;if [ $? -eq 0 ]; then echo $NS;fi)

# KUBENAMESPACE=$(NS=$(kubectl config view --minify | grep namespace | cut -c 16-) 2> /dev/null;if [ $? -eq 0 ]; then echo $NS;fi)

# kubectl config view --minify | grep namespace | cut -c 16-

# cc=$(kubectl config current-context); kubectl config view --output=jsonpath="{.contexts[?(@.name==\"$cc\")].context.namespace}"


#kctx=$(kubectl config view -o json | grep "current-context" | cut -c 24-) && kns=$(kubectl config view -o json | jq --arg ctx $kctx ".contexts[] | select(.name==$kctx) |.context.namespace") && echo "$kctx/$kns"

# kctx=$(kubectl config view -o json | grep "current-context" | cut -c 24-) && kns=$(kubectl config view -o json | jq --arg ctx "$kctx" ".contexts[] | select(.name==$ctx) |.context.namespace") && kay="breh" && echo "$kctx / $kns / $kay"

# kctx=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi) && kns=$(kubectl config view -o json | grep "name.*$kctx" -A 4 | grep "namespace" | cut -c 30-) && kay="breh" && echo "$kctx / $kns / $kay"