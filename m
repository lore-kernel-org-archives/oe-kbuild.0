Content-Type: multipart/mixed; boundary="===============4509675152135135520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10444/12404] security/keys/trusted-keys/trusted_tpm2.c:38:25: warning: Either the condition '!scratch' is redundant or there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedundantCheck]
Date: Wed, 14 Apr 2021 12:03:57 +0800
Message-ID: <202104141253.Bm7coOIy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4509675152135135520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   dcf1b51d6b2ac5da234ae6883ed0e9422c339588
commit: 14676f1eb79660b6ee262644fa788a5c42ac19e4 [10444/12404] security: ke=
ys: trusted: use ASN.1 TPM2 key format for the blobs
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
compiler: hppa64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> security/keys/trusted-keys/trusted_tpm2.c:38:25: warning: Either the con=
dition '!scratch' is redundant or there is pointer arithmetic with NULL poi=
nter. [nullPointerArithmeticRedundantCheck]
    u8 *end_work =3D scratch + SCRATCH_SIZE;
                           ^
   security/keys/trusted-keys/trusted_tpm2.c:50:6: note: Assuming that cond=
ition '!scratch' is not redundant
    if (!scratch)
        ^
   security/keys/trusted-keys/trusted_tpm2.c:38:25: note: Null pointer addi=
tion
    u8 *end_work =3D scratch + SCRATCH_SIZE;
                           ^

vim +38 security/keys/trusted-keys/trusted_tpm2.c

14676f1eb79660 James Bottomley 2021-01-27  30  =

14676f1eb79660 James Bottomley 2021-01-27  31  static int tpm2_key_encode(s=
truct trusted_key_payload *payload,
14676f1eb79660 James Bottomley 2021-01-27  32  			   struct trusted_key_opt=
ions *options,
14676f1eb79660 James Bottomley 2021-01-27  33  			   u8 *src, u32 len)
14676f1eb79660 James Bottomley 2021-01-27  34  {
14676f1eb79660 James Bottomley 2021-01-27  35  	const int SCRATCH_SIZE =3D =
PAGE_SIZE;
14676f1eb79660 James Bottomley 2021-01-27  36  	u8 *scratch =3D kmalloc(SCR=
ATCH_SIZE, GFP_KERNEL);
14676f1eb79660 James Bottomley 2021-01-27  37  	u8 *work =3D scratch, *work=
1;
14676f1eb79660 James Bottomley 2021-01-27 @38  	u8 *end_work =3D scratch + =
SCRATCH_SIZE;
14676f1eb79660 James Bottomley 2021-01-27  39  	u8 *priv, *pub;
14676f1eb79660 James Bottomley 2021-01-27  40  	u16 priv_len, pub_len;
14676f1eb79660 James Bottomley 2021-01-27  41  =

14676f1eb79660 James Bottomley 2021-01-27  42  	priv_len =3D get_unaligned_=
be16(src) + 2;
14676f1eb79660 James Bottomley 2021-01-27  43  	priv =3D src;
14676f1eb79660 James Bottomley 2021-01-27  44  =

14676f1eb79660 James Bottomley 2021-01-27  45  	src +=3D priv_len;
14676f1eb79660 James Bottomley 2021-01-27  46  =

14676f1eb79660 James Bottomley 2021-01-27  47  	pub_len =3D get_unaligned_b=
e16(src) + 2;
14676f1eb79660 James Bottomley 2021-01-27  48  	pub =3D src;
14676f1eb79660 James Bottomley 2021-01-27  49  =

14676f1eb79660 James Bottomley 2021-01-27  50  	if (!scratch)
14676f1eb79660 James Bottomley 2021-01-27  51  		return -ENOMEM;
14676f1eb79660 James Bottomley 2021-01-27  52  =

14676f1eb79660 James Bottomley 2021-01-27  53  	work =3D asn1_encode_oid(wo=
rk, end_work, tpm2key_oid,
14676f1eb79660 James Bottomley 2021-01-27  54  			       asn1_oid_len(tpm2k=
ey_oid));
14676f1eb79660 James Bottomley 2021-01-27  55  =

14676f1eb79660 James Bottomley 2021-01-27  56  	if (options->blobauth_len =
=3D=3D 0) {
14676f1eb79660 James Bottomley 2021-01-27  57  		unsigned char bool[3], *w =
=3D bool;
14676f1eb79660 James Bottomley 2021-01-27  58  		/* tag 0 is emptyAuth */
14676f1eb79660 James Bottomley 2021-01-27  59  		w =3D asn1_encode_boolean(=
w, w + sizeof(bool), true);
14676f1eb79660 James Bottomley 2021-01-27  60  		if (WARN(IS_ERR(w), "BUG: =
Boolean failed to encode"))
14676f1eb79660 James Bottomley 2021-01-27  61  			return PTR_ERR(w);
14676f1eb79660 James Bottomley 2021-01-27  62  		work =3D asn1_encode_tag(w=
ork, end_work, 0, bool, w - bool);
14676f1eb79660 James Bottomley 2021-01-27  63  	}
14676f1eb79660 James Bottomley 2021-01-27  64  =

14676f1eb79660 James Bottomley 2021-01-27  65  	/*
14676f1eb79660 James Bottomley 2021-01-27  66  	 * Assume both octet string=
s will encode to a 2 byte definite length
14676f1eb79660 James Bottomley 2021-01-27  67  	 *
14676f1eb79660 James Bottomley 2021-01-27  68  	 * Note: For a well behaved=
 TPM, this warning should never
14676f1eb79660 James Bottomley 2021-01-27  69  	 * trigger, so if it does t=
here's something nefarious going on
14676f1eb79660 James Bottomley 2021-01-27  70  	 */
14676f1eb79660 James Bottomley 2021-01-27  71  	if (WARN(work - scratch + p=
ub_len + priv_len + 14 > SCRATCH_SIZE,
14676f1eb79660 James Bottomley 2021-01-27  72  		 "BUG: scratch buffer is t=
oo small"))
14676f1eb79660 James Bottomley 2021-01-27  73  		return -EINVAL;
14676f1eb79660 James Bottomley 2021-01-27  74  =

14676f1eb79660 James Bottomley 2021-01-27  75  	work =3D asn1_encode_intege=
r(work, end_work, options->keyhandle);
14676f1eb79660 James Bottomley 2021-01-27  76  	work =3D asn1_encode_octet_=
string(work, end_work, pub, pub_len);
14676f1eb79660 James Bottomley 2021-01-27  77  	work =3D asn1_encode_octet_=
string(work, end_work, priv, priv_len);
14676f1eb79660 James Bottomley 2021-01-27  78  =

14676f1eb79660 James Bottomley 2021-01-27  79  	work1 =3D payload->blob;
14676f1eb79660 James Bottomley 2021-01-27  80  	work1 =3D asn1_encode_seque=
nce(work1, work1 + sizeof(payload->blob),
14676f1eb79660 James Bottomley 2021-01-27  81  				     scratch, work - scr=
atch);
14676f1eb79660 James Bottomley 2021-01-27  82  	if (WARN(IS_ERR(work1), "BU=
G: ASN.1 encoder failed"))
14676f1eb79660 James Bottomley 2021-01-27  83  		return PTR_ERR(work1);
14676f1eb79660 James Bottomley 2021-01-27  84  =

14676f1eb79660 James Bottomley 2021-01-27  85  	return work1 - payload->blo=
b;
14676f1eb79660 James Bottomley 2021-01-27  86  }
14676f1eb79660 James Bottomley 2021-01-27  87  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4509675152135135520==--

