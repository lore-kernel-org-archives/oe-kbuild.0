Content-Type: multipart/mixed; boundary="===============6400873305151948586=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:56:8: warning: Variable 'in_sg' is reassigned a value before the old one has been used.
Date: Sun, 13 Sep 2020 09:40:55 +0800
Message-ID: <202009130951.AmrMroB2%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6400873305151948586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Corentin Labbe <clabbe.montjoie@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   729e3d091984487f7aa1ebfabfe594e5b317ed0f
commit: f08fcced6d0017c39cb6eccb571290867119d049 crypto: allwinner - Add su=
n8i-ss cryptographic offloader
date:   11 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:56:8: warning: Varia=
ble 'in_sg' is reassigned a value before the old one has been used. [redund=
antAssignment]
    in_sg =3D areq->src;
          ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:24:0: note: Variable=
 'in_sg' is reassigned a value before the old one has been used.
    struct scatterlist *in_sg =3D areq->src;
   ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:56:8: note: Variable=
 'in_sg' is reassigned a value before the old one has been used.
    in_sg =3D areq->src;
          ^
>> drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:57:9: warning: Varia=
ble 'out_sg' is reassigned a value before the old one has been used. [redun=
dantAssignment]
    out_sg =3D areq->dst;
           ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:25:0: note: Variable=
 'out_sg' is reassigned a value before the old one has been used.
    struct scatterlist *out_sg =3D areq->dst;
   ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:57:9: note: Variable=
 'out_sg' is reassigned a value before the old one has been used.
    out_sg =3D areq->dst;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df08fcced6d0017c39cb6eccb571290867119d049
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout f08fcced6d0017c39cb6eccb571290867119d049
vim +/in_sg +56 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c

f08fcced6d0017 Corentin Labbe 2019-10-25  21  =

f08fcced6d0017 Corentin Labbe 2019-10-25  22  static bool sun8i_ss_need_fal=
lback(struct skcipher_request *areq)
f08fcced6d0017 Corentin Labbe 2019-10-25  23  {
f08fcced6d0017 Corentin Labbe 2019-10-25  24  	struct scatterlist *in_sg =
=3D areq->src;
f08fcced6d0017 Corentin Labbe 2019-10-25  25  	struct scatterlist *out_sg =
=3D areq->dst;
f08fcced6d0017 Corentin Labbe 2019-10-25  26  	struct scatterlist *sg;
f08fcced6d0017 Corentin Labbe 2019-10-25  27  =

f08fcced6d0017 Corentin Labbe 2019-10-25  28  	if (areq->cryptlen =3D=3D 0 =
|| areq->cryptlen % 16)
f08fcced6d0017 Corentin Labbe 2019-10-25  29  		return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  30  =

f08fcced6d0017 Corentin Labbe 2019-10-25  31  	if (sg_nents(areq->src) > 8 =
|| sg_nents(areq->dst) > 8)
f08fcced6d0017 Corentin Labbe 2019-10-25  32  		return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  33  =

f08fcced6d0017 Corentin Labbe 2019-10-25  34  	sg =3D areq->src;
f08fcced6d0017 Corentin Labbe 2019-10-25  35  	while (sg) {
f08fcced6d0017 Corentin Labbe 2019-10-25  36  		if ((sg->length % 16) !=3D =
0)
f08fcced6d0017 Corentin Labbe 2019-10-25  37  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  38  		if ((sg_dma_len(sg) % 16) !=
=3D 0)
f08fcced6d0017 Corentin Labbe 2019-10-25  39  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  40  		if (!IS_ALIGNED(sg->offset,=
 16))
f08fcced6d0017 Corentin Labbe 2019-10-25  41  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  42  		sg =3D sg_next(sg);
f08fcced6d0017 Corentin Labbe 2019-10-25  43  	}
f08fcced6d0017 Corentin Labbe 2019-10-25  44  	sg =3D areq->dst;
f08fcced6d0017 Corentin Labbe 2019-10-25  45  	while (sg) {
f08fcced6d0017 Corentin Labbe 2019-10-25  46  		if ((sg->length % 16) !=3D =
0)
f08fcced6d0017 Corentin Labbe 2019-10-25  47  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  48  		if ((sg_dma_len(sg) % 16) !=
=3D 0)
f08fcced6d0017 Corentin Labbe 2019-10-25  49  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  50  		if (!IS_ALIGNED(sg->offset,=
 16))
f08fcced6d0017 Corentin Labbe 2019-10-25  51  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  52  		sg =3D sg_next(sg);
f08fcced6d0017 Corentin Labbe 2019-10-25  53  	}
f08fcced6d0017 Corentin Labbe 2019-10-25  54  =

f08fcced6d0017 Corentin Labbe 2019-10-25  55  	/* SS need same numbers of S=
G (with same length) for source and destination */
f08fcced6d0017 Corentin Labbe 2019-10-25 @56  	in_sg =3D areq->src;
f08fcced6d0017 Corentin Labbe 2019-10-25 @57  	out_sg =3D areq->dst;
f08fcced6d0017 Corentin Labbe 2019-10-25  58  	while (in_sg && out_sg) {
f08fcced6d0017 Corentin Labbe 2019-10-25  59  		if (in_sg->length !=3D out_=
sg->length)
f08fcced6d0017 Corentin Labbe 2019-10-25  60  			return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  61  		in_sg =3D sg_next(in_sg);
f08fcced6d0017 Corentin Labbe 2019-10-25  62  		out_sg =3D sg_next(out_sg);
f08fcced6d0017 Corentin Labbe 2019-10-25  63  	}
f08fcced6d0017 Corentin Labbe 2019-10-25  64  	if (in_sg || out_sg)
f08fcced6d0017 Corentin Labbe 2019-10-25  65  		return true;
f08fcced6d0017 Corentin Labbe 2019-10-25  66  	return false;
f08fcced6d0017 Corentin Labbe 2019-10-25  67  }
f08fcced6d0017 Corentin Labbe 2019-10-25  68  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6400873305151948586==--

