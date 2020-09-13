Content-Type: multipart/mixed; boundary="===============8765074059814673812=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v11 4/5] security: keys: trusted: use ASN.1 TPM2 key format for the blobs
Date: Sun, 13 Sep 2020 17:35:27 +0800
Message-ID: <202009131715.alvmDNan%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8765074059814673812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200912172643.9063-5-James.Bottomley@HansenPartnership.com>
References: <20200912172643.9063-5-James.Bottomley@HansenPartnership.com>
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
TO: linux-integrity(a)vger.kernel.org
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: keyrings(a)vger.kernel.org
CC: David Howells <dhowells@redhat.com>

Hi James,

I love your patch! Perhaps something to improve:

[auto build test WARNING on integrity/next-integrity]
[also build test WARNING on linus/master v5.9-rc4 next-20200911]
[cannot apply to security/next-testing dhowells-fs/fscache-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/James-Bottomley/TPM-2-0-tr=
usted-key-rework/20200913-013201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integri=
ty.git next-integrity
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

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

# https://github.com/0day-ci/linux/commit/ce13d03d29ab9ef7c6236ddfbd25ef4ea=
78dccff
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review James-Bottomley/TPM-2-0-trusted-key-rework=
/20200913-013201
git checkout ce13d03d29ab9ef7c6236ddfbd25ef4ea78dccff
vim +38 security/keys/trusted-keys/trusted_tpm2.c

ce13d03d29ab9e James Bottomley 2020-09-12  30  =

ce13d03d29ab9e James Bottomley 2020-09-12  31  static int tpm2_key_encode(s=
truct trusted_key_payload *payload,
ce13d03d29ab9e James Bottomley 2020-09-12  32  			   struct trusted_key_opt=
ions *options,
ce13d03d29ab9e James Bottomley 2020-09-12  33  			   u8 *src, u32 len)
ce13d03d29ab9e James Bottomley 2020-09-12  34  {
ce13d03d29ab9e James Bottomley 2020-09-12  35  	const int SCRATCH_SIZE =3D =
PAGE_SIZE;
ce13d03d29ab9e James Bottomley 2020-09-12  36  	u8 *scratch =3D kmalloc(SCR=
ATCH_SIZE, GFP_KERNEL);
ce13d03d29ab9e James Bottomley 2020-09-12  37  	u8 *work =3D scratch, *work=
1;
ce13d03d29ab9e James Bottomley 2020-09-12 @38  	u8 *end_work =3D scratch + =
SCRATCH_SIZE;
ce13d03d29ab9e James Bottomley 2020-09-12  39  	u8 *priv, *pub;
ce13d03d29ab9e James Bottomley 2020-09-12  40  	u16 priv_len, pub_len;
ce13d03d29ab9e James Bottomley 2020-09-12  41  =

ce13d03d29ab9e James Bottomley 2020-09-12  42  	priv_len =3D get_unaligned_=
be16(src) + 2;
ce13d03d29ab9e James Bottomley 2020-09-12  43  	priv =3D src;
ce13d03d29ab9e James Bottomley 2020-09-12  44  =

ce13d03d29ab9e James Bottomley 2020-09-12  45  	src +=3D priv_len;
ce13d03d29ab9e James Bottomley 2020-09-12  46  =

ce13d03d29ab9e James Bottomley 2020-09-12  47  	pub_len =3D get_unaligned_b=
e16(src) + 2;
ce13d03d29ab9e James Bottomley 2020-09-12  48  	pub =3D src;
ce13d03d29ab9e James Bottomley 2020-09-12  49  =

ce13d03d29ab9e James Bottomley 2020-09-12  50  	if (!scratch)
ce13d03d29ab9e James Bottomley 2020-09-12  51  		return -ENOMEM;
ce13d03d29ab9e James Bottomley 2020-09-12  52  =

ce13d03d29ab9e James Bottomley 2020-09-12  53  	work =3D asn1_encode_oid(wo=
rk, end_work, tpm2key_oid,
ce13d03d29ab9e James Bottomley 2020-09-12  54  			       asn1_oid_len(tpm2k=
ey_oid));
ce13d03d29ab9e James Bottomley 2020-09-12  55  =

ce13d03d29ab9e James Bottomley 2020-09-12  56  	if (options->blobauth_len =
=3D=3D 0) {
ce13d03d29ab9e James Bottomley 2020-09-12  57  		unsigned char bool[3], *w =
=3D bool;
ce13d03d29ab9e James Bottomley 2020-09-12  58  		/* tag 0 is emptyAuth */
ce13d03d29ab9e James Bottomley 2020-09-12  59  		w =3D asn1_encode_boolean(=
w, w + sizeof(bool), true);
ce13d03d29ab9e James Bottomley 2020-09-12  60  		if (WARN(IS_ERR(w), "BUG: =
Boolean failed to encode"))
ce13d03d29ab9e James Bottomley 2020-09-12  61  			return PTR_ERR(w);
ce13d03d29ab9e James Bottomley 2020-09-12  62  		work =3D asn1_encode_tag(w=
ork, end_work, 0, bool, w - bool);
ce13d03d29ab9e James Bottomley 2020-09-12  63  	}
ce13d03d29ab9e James Bottomley 2020-09-12  64  =

ce13d03d29ab9e James Bottomley 2020-09-12  65  	/*
ce13d03d29ab9e James Bottomley 2020-09-12  66  	 * Assume both octet string=
s will encode to a 2 byte definite length
ce13d03d29ab9e James Bottomley 2020-09-12  67  	 *
ce13d03d29ab9e James Bottomley 2020-09-12  68  	 * Note: For a well behaved=
 TPM, this warning should never
ce13d03d29ab9e James Bottomley 2020-09-12  69  	 * trigger, so if it does t=
here's something nefarious going on
ce13d03d29ab9e James Bottomley 2020-09-12  70  	 */
ce13d03d29ab9e James Bottomley 2020-09-12  71  	if (WARN(work - scratch + p=
ub_len + priv_len + 14 > SCRATCH_SIZE,
ce13d03d29ab9e James Bottomley 2020-09-12  72  		 "BUG: scratch buffer is t=
oo small"))
ce13d03d29ab9e James Bottomley 2020-09-12  73  		return -EINVAL;
ce13d03d29ab9e James Bottomley 2020-09-12  74  =

ce13d03d29ab9e James Bottomley 2020-09-12  75  	work =3D asn1_encode_intege=
r(work, end_work, options->keyhandle);
ce13d03d29ab9e James Bottomley 2020-09-12  76  	work =3D asn1_encode_octet_=
string(work, end_work, pub, pub_len);
ce13d03d29ab9e James Bottomley 2020-09-12  77  	work =3D asn1_encode_octet_=
string(work, end_work, priv, priv_len);
ce13d03d29ab9e James Bottomley 2020-09-12  78  =

ce13d03d29ab9e James Bottomley 2020-09-12  79  	work1 =3D payload->blob;
ce13d03d29ab9e James Bottomley 2020-09-12  80  	work1 =3D asn1_encode_seque=
nce(work1, work1 + sizeof(payload->blob),
ce13d03d29ab9e James Bottomley 2020-09-12  81  				     scratch, work - scr=
atch);
ce13d03d29ab9e James Bottomley 2020-09-12  82  	if (WARN(IS_ERR(work1), "BU=
G: ASN.1 encoder failed"))
ce13d03d29ab9e James Bottomley 2020-09-12  83  		return PTR_ERR(work1);
ce13d03d29ab9e James Bottomley 2020-09-12  84  =

ce13d03d29ab9e James Bottomley 2020-09-12  85  	return work1 - payload->blo=
b;
ce13d03d29ab9e James Bottomley 2020-09-12  86  }
ce13d03d29ab9e James Bottomley 2020-09-12  87  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8765074059814673812==--

