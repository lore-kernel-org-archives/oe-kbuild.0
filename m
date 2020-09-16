Content-Type: multipart/mixed; boundary="===============6335026669954031055=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6552/7920] net/sunrpc/auth_gss/gss_krb5_mech.c:254:38: warning: Invalid test for overflow 'p+20<p'. Condition is always false unless there is overflow, and overflow is undefined behaviour.
Date: Wed, 16 Sep 2020 13:57:47 +0800
Message-ID: <202009161341.mJoDy6IE%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6335026669954031055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6b02addb1d1748d21dd1261e46029b264be4e5a0
commit: e33d2a7b3041d7f8cd1f0a2a4ca42a5bc112b14e [6552/7920] SUNRPC: remove=
 RC4-HMAC-MD5 support from KerberosV
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/sunrpc/auth_gss/gss_krb5_keys.c:219:6: warning: Variable 'ret' is re=
assigned a value before the old one has been used. [redundantAssignment]
    ret =3D (*(gk5e->mk_key))(gk5e, &inblock, outkey);
        ^
   net/sunrpc/auth_gss/gss_krb5_keys.c:168:6: note: Variable 'ret' is reass=
igned a value before the old one has been used.
    ret =3D ENOMEM;
        ^
   net/sunrpc/auth_gss/gss_krb5_keys.c:219:6: note: Variable 'ret' is reass=
igned a value before the old one has been used.
    ret =3D (*(gk5e->mk_key))(gk5e, &inblock, outkey);
        ^
>> net/sunrpc/auth_gss/gss_krb5_mech.c:254:38: warning: Invalid test for ov=
erflow 'p+20<p'. Condition is always false unless there is overflow, and ov=
erflow is undefined behaviour. [invalidTestForOverflow]
    if (unlikely(p + 20 > end || p + 20 < p)) {
                                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3De33d2a7b3041d7f8cd1f0a2a4ca42a5bc112b14e
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout e33d2a7b3041d7f8cd1f0a2a4ca42a5bc112b14e
vim +254 net/sunrpc/auth_gss/gss_krb5_mech.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  229  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  230  static int
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  231  gss_import_v1_context(const=
 void *p, const void *end, struct krb5_ctx *ctx)
^1da177e4c3f41 Linus Torvalds  2005-04-16  232  {
c3be6577d82a9f Paul Burton     2018-11-01  233  	u32 seq_send;
e678e06bf8fa25 J. Bruce Fields 2006-12-04  234  	int tmp;
294ec5b87a8aae Arnd Bergmann   2018-06-07  235  	u32 time32;
^1da177e4c3f41 Linus Torvalds  2005-04-16  236  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  237  	p =3D simple_get_bytes(p, =
end, &ctx->initiate, sizeof(ctx->initiate));
^1da177e4c3f41 Linus Torvalds  2005-04-16  238  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  239  		goto out_err;
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  240  =

a8cc1cb7d7a12b Kevin Coffman   2010-03-17  241  	/* Old format supports onl=
y DES!  Any other enctype uses new format */
1ac3719a2214c5 Kevin Coffman   2010-03-17  242  	ctx->enctype =3D ENCTYPE_D=
ES_CBC_RAW;
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  243  =

81d4a4333a1dfd Kevin Coffman   2010-03-17  244  	ctx->gk5e =3D get_gss_krb5=
_enctype(ctx->enctype);
ce8477e1176389 Bian Naimeng    2010-09-12  245  	if (ctx->gk5e =3D=3D NULL)=
 {
ce8477e1176389 Bian Naimeng    2010-09-12  246  		p =3D ERR_PTR(-EINVAL);
81d4a4333a1dfd Kevin Coffman   2010-03-17  247  		goto out_err;
ce8477e1176389 Bian Naimeng    2010-09-12  248  	}
81d4a4333a1dfd Kevin Coffman   2010-03-17  249  =

717757ad1038ab J. Bruce Fields 2006-12-04  250  	/* The downcall format was=
 designed before we completely understood
717757ad1038ab J. Bruce Fields 2006-12-04  251  	 * the uses of the context=
 fields; so it includes some stuff we
717757ad1038ab J. Bruce Fields 2006-12-04  252  	 * just give some minimal =
sanity-checking, and some we ignore
717757ad1038ab J. Bruce Fields 2006-12-04  253  	 * completely (like the ne=
xt twenty bytes): */
ce8477e1176389 Bian Naimeng    2010-09-12 @254  	if (unlikely(p + 20 > end =
|| p + 20 < p)) {
ce8477e1176389 Bian Naimeng    2010-09-12  255  		p =3D ERR_PTR(-EFAULT);
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  256  		goto out_err;
ce8477e1176389 Bian Naimeng    2010-09-12  257  	}
717757ad1038ab J. Bruce Fields 2006-12-04  258  	p +=3D 20;
e678e06bf8fa25 J. Bruce Fields 2006-12-04  259  	p =3D simple_get_bytes(p, =
end, &tmp, sizeof(tmp));
^1da177e4c3f41 Linus Torvalds  2005-04-16  260  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  261  		goto out_err;
ef338bee3f4f50 Kevin Coffman   2007-11-09  262  	if (tmp !=3D SGN_ALG_DES_M=
AC_MD5) {
ef338bee3f4f50 Kevin Coffman   2007-11-09  263  		p =3D ERR_PTR(-ENOSYS);
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  264  		goto out_err;
ef338bee3f4f50 Kevin Coffman   2007-11-09  265  	}
d922a84a8bf1d6 J. Bruce Fields 2006-12-04  266  	p =3D simple_get_bytes(p, =
end, &tmp, sizeof(tmp));
^1da177e4c3f41 Linus Torvalds  2005-04-16  267  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  268  		goto out_err;
ef338bee3f4f50 Kevin Coffman   2007-11-09  269  	if (tmp !=3D SEAL_ALG_DES)=
 {
ef338bee3f4f50 Kevin Coffman   2007-11-09  270  		p =3D ERR_PTR(-ENOSYS);
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  271  		goto out_err;
ef338bee3f4f50 Kevin Coffman   2007-11-09  272  	}
294ec5b87a8aae Arnd Bergmann   2018-06-07  273  	p =3D simple_get_bytes(p, =
end, &time32, sizeof(time32));
^1da177e4c3f41 Linus Torvalds  2005-04-16  274  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  275  		goto out_err;
294ec5b87a8aae Arnd Bergmann   2018-06-07  276  	/* unsigned 32-bit time ov=
erflows in year 2106 */
294ec5b87a8aae Arnd Bergmann   2018-06-07  277  	ctx->endtime =3D (time64_t=
)time32;
c3be6577d82a9f Paul Burton     2018-11-01  278  	p =3D simple_get_bytes(p, =
end, &seq_send, sizeof(seq_send));
^1da177e4c3f41 Linus Torvalds  2005-04-16  279  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  280  		goto out_err;
c3be6577d82a9f Paul Burton     2018-11-01  281  	atomic_set(&ctx->seq_send,=
 seq_send);
^1da177e4c3f41 Linus Torvalds  2005-04-16  282  	p =3D simple_get_netobj(p,=
 end, &ctx->mech_used);
^1da177e4c3f41 Linus Torvalds  2005-04-16  283  	if (IS_ERR(p))
a8cc1cb7d7a12b Kevin Coffman   2010-03-17  284  		goto out_err;
81d4a4333a1dfd Kevin Coffman   2010-03-17  285  	p =3D get_key(p, end, ctx,=
 &ctx->enc);
^1da177e4c3f41 Linus Torvalds  2005-04-16  286  	if (IS_ERR(p))
^1da177e4c3f41 Linus Torvalds  2005-04-16  287  		goto out_err_free_mech;
81d4a4333a1dfd Kevin Coffman   2010-03-17  288  	p =3D get_key(p, end, ctx,=
 &ctx->seq);
^1da177e4c3f41 Linus Torvalds  2005-04-16  289  	if (IS_ERR(p))
^1da177e4c3f41 Linus Torvalds  2005-04-16  290  		goto out_err_free_key1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  291  	if (p !=3D end) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  292  		p =3D ERR_PTR(-EFAULT);
^1da177e4c3f41 Linus Torvalds  2005-04-16  293  		goto out_err_free_key2;
^1da177e4c3f41 Linus Torvalds  2005-04-16  294  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  295  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  296  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  297  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  298  out_err_free_key2:
e9e575b8f29445 Kees Cook       2018-09-18  299  	crypto_free_sync_skcipher(=
ctx->seq);
^1da177e4c3f41 Linus Torvalds  2005-04-16  300  out_err_free_key1:
e9e575b8f29445 Kees Cook       2018-09-18  301  	crypto_free_sync_skcipher(=
ctx->enc);
^1da177e4c3f41 Linus Torvalds  2005-04-16  302  out_err_free_mech:
^1da177e4c3f41 Linus Torvalds  2005-04-16  303  	kfree(ctx->mech_used.data);
^1da177e4c3f41 Linus Torvalds  2005-04-16  304  out_err:
^1da177e4c3f41 Linus Torvalds  2005-04-16  305  	return PTR_ERR(p);
^1da177e4c3f41 Linus Torvalds  2005-04-16  306  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  307  =


:::::: The code at line 254 was first introduced by commit
:::::: ce8477e1176389ed920550f4c925ad4a815b22d5 gss:krb5 miss returning err=
or to caller when import security context

:::::: TO: Bian Naimeng <biannm@cn.fujitsu.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6335026669954031055==--

