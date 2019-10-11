Content-Type: multipart/mixed; boundary="===============1917465778700021879=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [arm-integrator:ixp4xx-test 22/23] drivers/crypto/ixp4xx_crypto.c:1060 aead_perform() error: uninitialized symbol 'icv_rev_aes'.
Date: Fri, 11 Oct 2019 13:41:17 +0300
Message-ID: <20191011104117.GT13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1917465778700021879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git ixp4xx-test
head:   1b826e686b390fd1eeb347def38185fefcbd5140
commit: 811c4aaa704314770fe5a70944100732fdc1f3b8 [22/23] crypto: ixp4xx: av=
oid BUILD_BUG_ON()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/crypto/ixp4xx_crypto.c:1060 aead_perform() error: uninitialized sym=
bol 'icv_rev_aes'.

# https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.g=
it/commit/?id=3D811c4aaa704314770fe5a70944100732fdc1f3b8
git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/g=
it/linusw/linux-integrator.git
git remote update arm-integrator
git checkout 811c4aaa704314770fe5a70944100732fdc1f3b8
vim +/icv_rev_aes +1060 drivers/crypto/ixp4xx_crypto.c

d7295a8dc965ee Herbert Xu           2015-07-30  1054  	if (unlikely(lastlen=
 < authsize)) {
811c4aaa704314 Arnd Bergmann        2019-08-27  1055  		dma_addr_t icv_rev_=
aes;
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1056  		/* The 12 hmac byte=
s are scattered,
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1057  		 * we need to copy =
them into a safe buffer */
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1058  		req_ctx->hmac_virt =
=3D dma_pool_alloc(buffer_pool, flags,
811c4aaa704314 Arnd Bergmann        2019-08-27  1059  						    &icv_rev_ae=
s);
811c4aaa704314 Arnd Bergmann        2019-08-27 @1060  		crypt->icv_rev_aes =
=3D (u32)icv_rev_aes;
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^
Assigned before error handling.

81bef0150074d6 Christian Hohnstaedt 2008-06-25  1061  		if (unlikely(!req_c=
tx->hmac_virt))
28389575a8cf93 Herbert Xu           2017-08-02  1062  			goto free_buf_dst;
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1063  		if (!encrypt) {
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1064  			scatterwalk_map_an=
d_copy(req_ctx->hmac_virt,
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1065  				req->src, cryptle=
n, authsize, 0);
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1066  		}
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1067  		req_ctx->encrypt =
=3D encrypt;
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1068  	} else {
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1069  		req_ctx->hmac_virt =
=3D NULL;
81bef0150074d6 Christian Hohnstaedt 2008-06-25  1070  	}

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============1917465778700021879==--

