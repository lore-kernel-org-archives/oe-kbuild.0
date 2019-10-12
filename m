Content-Type: multipart/mixed; boundary="===============3886256863703545623=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [arm-integrator:ixp4xx-test 22/23] drivers/crypto/ixp4xx_crypto.c:1060 aead_perform() error: uninitialized symbol 'icv_rev_aes'.
Date: Sat, 12 Oct 2019 11:08:17 +0300
Message-ID: <20191012080817.GU13286@kadam>
In-Reply-To: <CAK8P3a2ispwHfyBmRQa3GTAw8EWOEfNKHOinkQO=v-DNvWi9pw@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3886256863703545623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 11:48:16PM +0200, Arnd Bergmann wrote:
> On Fri, Oct 11, 2019 at 12:41 PM Dan Carpenter <dan.carpenter@oracle.co=
m> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-in=
tegrator.git ixp4xx-test
> > head:   1b826e686b390fd1eeb347def38185fefcbd5140
> > commit: 811c4aaa704314770fe5a70944100732fdc1f3b8 [22/23] crypto: ixp4xx=
: avoid BUILD_BUG_ON()
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/crypto/ixp4xx_crypto.c:1060 aead_perform() error: uninitialized=
 symbol 'icv_rev_aes'.
> =

> Right, this was uncovered by allowing the driver to be compile-tested on
> x86. smatch is of course right to point out the uninitialized variable,
> but it seems harmless as it is only uninitialized in case of an error,
> and the uninitialized variable here gets copied into another data structu=
re
> that then gets put back, so it seems completely harmless
> =

> There is a trivial fix:
> =

> diff --git a/drivers/crypto/ixp4xx_crypto.c b/drivers/crypto/ixp4xx_crypt=
o.c
> index 1c6a04ecbf8f..a4eb1e98c87b 100644
> --- a/drivers/crypto/ixp4xx_crypto.c
> +++ b/drivers/crypto/ixp4xx_crypto.c
> @@ -1057,9 +1057,9 @@ static int aead_perform(struct aead_request
> *req, int encrypt,
>                  * we need to copy them into a safe buffer */
>                 req_ctx->hmac_virt =3D dma_pool_alloc(buffer_pool, flags,
>                                                     &icv_rev_aes);
> -               crypt->icv_rev_aes =3D (u32)icv_rev_aes;
>                 if (unlikely(!req_ctx->hmac_virt))
>                         goto free_buf_dst;
> +               crypt->icv_rev_aes =3D (u32)icv_rev_aes;
>                 if (!encrypt) {
>                         scatterwalk_map_and_copy(req_ctx->hmac_virt,
>                                 req->src, cryptlen, authsize, 0);
> =

> Dan, I think I would just leave it unchanged for a case like this, but I
> can send a patch if you think it's worth addressing the warning.

This is a new sort of harmless but not false positive warning.  I've
been conflicted on what to do with them, so I just report them when
they're new or ignore them when they're old.

I feel like ten years from now we will have fixed all these sorts of
warnings.

regards,
dan carpenter

--===============3886256863703545623==--

