Content-Type: multipart/mixed; boundary="===============4964391506112507532=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8292/10499] drivers/tty/moxa.c:767:2: warning: Using pointer to local variable 'len' that is out of scope. [invalidLifetime]
Date: Wed, 07 Apr 2021 21:30:47 +0800
Message-ID: <202104072135.vAcPCjzR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4964391506112507532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5103a5be098c0dae5d4b057520d7e9f4c5570979
commit: 969f31e9eae3fb5d8388677c2ec34c2f447f7376 [8292/10499] lib: fix kcon=
fig dependency on ARCH_WANT_FRAME_POINTERS
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/tty/moxa.c:767:2: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:767:2: note: Array decayed to pointer here.
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:767:2: note: Using pointer to local variable 'len' th=
at is out of scope.
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:771:18: warning: Using pointer to local variable 'len=
' that is out of scope. [invalidLifetime]
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:771:18: note: Array decayed to pointer here.
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:771:18: note: Using pointer to local variable 'len' t=
hat is out of scope.
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:774:42: warning: Using pointer to local variable 'len=
' that is out of scope. [invalidLifetime]
       "at offset %u, but going onn", (u32)len);
                                            ^
   drivers/tty/moxa.c:771:18: note: Array decayed to pointer here.
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:774:42: note: Using pointer to local variable 'len' t=
hat is out of scope.
       "at offset %u, but going onn", (u32)len);
                                            ^
   drivers/tty/moxa.c:779:3: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:779:3: note: Array decayed to pointer here.
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:779:3: note: Using pointer to local variable 'len' th=
at is out of scope.
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:782:6: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
    if (len !=3D fw->size) {
        ^
   drivers/tty/moxa.c:779:3: note: Array decayed to pointer here.
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:782:6: note: Using pointer to local variable 'len' th=
at is out of scope.
    if (len !=3D fw->size) {
        ^

vim +/len +767 drivers/tty/moxa.c

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  730  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  731  static in=
t moxa_load_fw(struct moxa_board_conf *brd, const struct firmware *fw)
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  732  {
2bca76e89bc43f drivers/char/moxa.c David Howells 2008-07-08  733  	const vo=
id *ptr =3D fw->data;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  734  	char rsn=
[64];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  735  	u16 lens=
[5];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  736  	size_t l=
en;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  737  	unsigned=
 int a, lenp, lencnt;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  738  	int ret =
=3D -EINVAL;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  739  	struct {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  740  		__le32 =
magic;	/* 0x34303430 */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  741  		u8 rese=
rved1[2];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  742  		u8 type=
;	/* UNIX =3D 3 */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  743  		u8 mode=
l;	/* C218T=3D1, C320T=3D2, CP204=3D3 */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  744  		u8 rese=
rved2[8];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  745  		__le16 =
len[5];
2bca76e89bc43f drivers/char/moxa.c David Howells 2008-07-08  746  	} const =
*hdr =3D ptr;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  747  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  748  	BUILD_BU=
G_ON(ARRAY_SIZE(hdr->len) !=3D ARRAY_SIZE(lens));
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  749  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  750  	if (fw->=
size < MOXA_FW_HDRLEN) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  751  		strcpy(=
rsn, "too short (even header won't fit)");
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  752  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  753  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  754  	if (hdr-=
>magic !=3D cpu_to_le32(0x30343034)) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  755  		sprintf=
(rsn, "bad magic: %.8x", le32_to_cpu(hdr->magic));
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  756  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  757  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  758  	if (hdr-=
>type !=3D 3) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  759  		sprintf=
(rsn, "not for linux, type is %u", hdr->type);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  760  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  761  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  762  	if (moxa=
_check_fw_model(brd, hdr->model)) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  763  		sprintf=
(rsn, "not for this card, model is %u", hdr->model);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  764  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  765  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  766  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30 @767  	len =3D =
MOXA_FW_HDRLEN;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  768  	lencnt =
=3D hdr->model =3D=3D 2 ? 5 : 3;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  769  	for (a =
=3D 0; a < ARRAY_SIZE(lens); a++) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  770  		lens[a]=
 =3D le16_to_cpu(hdr->len[a]);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  771  		if (len=
s[a] && len + lens[a] <=3D fw->size &&
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  772  				moxa_=
check_fw(&fw->data[len]))
eaa95a8da6366c drivers/char/moxa.c Jiri Slaby    2008-04-30  773  			printk=
(KERN_WARNING "MOXA firmware: unexpected input "
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  774  				"at o=
ffset %u, but going on\n", (u32)len);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  775  		if (!le=
ns[a] && a < lencnt) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  776  			sprint=
f(rsn, "too few entries in fw file");
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  777  			goto e=
rr;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  778  		}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  779  		len +=
=3D lens[a];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  780  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  781  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  782  	if (len =
!=3D fw->size) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  783  		sprintf=
(rsn, "bad length: %u (should be %u)", (u32)fw->size,
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  784  				(u32)=
len);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  785  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  786  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  787  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  788  	ptr +=3D=
 MOXA_FW_HDRLEN;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  789  	lenp =3D=
 0; /* bios */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  790  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  791  	strcpy(r=
sn, "read above");
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  792  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  793  	ret =3D =
moxa_load_bios(brd, ptr, lens[lenp]);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  794  	if (ret)
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  795  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  796  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  797  	/* we sk=
ip the tty section (lens[1]), since we don't need it */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  798  	ptr +=3D=
 lens[lenp] + lens[lenp + 1];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  799  	lenp +=
=3D 2; /* comm */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  800  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  801  	if (hdr-=
>model =3D=3D 2) {
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  802  		ret =3D=
 moxa_load_320b(brd, ptr, lens[lenp]);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  803  		if (ret)
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  804  			goto e=
rr;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  805  		/* skip=
 another tty */
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  806  		ptr +=
=3D lens[lenp] + lens[lenp + 1];
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  807  		lenp +=
=3D 2;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  808  	}
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  809  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  810  	ret =3D =
moxa_load_code(brd, ptr, lens[lenp]);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  811  	if (ret)
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  812  		goto er=
r;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  813  =

037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  814  	return 0;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  815  err:
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  816  	printk(K=
ERN_ERR "firmware failed to load, reason: %s\n", rsn);
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  817  	return r=
et;
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  818  }
037182346f0991 drivers/char/moxa.c Jiri Slaby    2008-04-30  819  =


:::::: The code at line 767 was first introduced by commit
:::::: 037182346f0991683cc7320a257c3f6089432cee Char: moxa, add firmware lo=
ading

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4964391506112507532==--

