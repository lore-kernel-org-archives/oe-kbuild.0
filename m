Content-Type: multipart/mixed; boundary="===============6373003560962339812=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [afaerber:rtd1295-next 53/165] drivers/soc/realtek/sb2.c:25:27: warning: 'base' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
Date: Sun, 12 Apr 2020 20:07:55 +0800
Message-ID: <202004122052.0lLUCpZk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6373003560962339812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Andreas F=C3=A4rber" <afaerber@suse.de>

tree:   https://github.com/afaerber/linux.git rtd1295-next
head:   89dddc4c437454ce2c1df9bf0503a7efdfcf1102
commit: fa76fee43094640fbec4ac88b854e020f26970a8 [53/165] soc: realtek: Add=
 SB2 driver
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/soc/realtek/sb2.c:25:27: warning: 'base' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
    val =3D readl_relaxed(base + SB2_DBG_INT);
                             ^
   drivers/soc/realtek/sb2.c:30:99: warning: 'base' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
     writel_relaxed(SB2_DBG_INT_ACPU_INT_EN | SB2_DBG_INT_SCPU_INT_EN | SB2=
_DBG_INT_WRITE_DATA, base + SB2_DBG_INT);
                                                                           =
                          ^
   drivers/soc/realtek/sb2.c:32:30: warning: 'base' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
     cause =3D readl_relaxed(base + SB2_DBG_ADDR1);
                                ^
   drivers/soc/realtek/sb2.c:35:30: warning: 'base' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
      addr =3D readl_relaxed(base + SB2_DBG_ADDR_SYSTEM);
                                ^
   drivers/soc/realtek/sb2.c:38:30: warning: 'base' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
      addr =3D readl_relaxed(base + SB2_DBG_ADDR_AUDIO);
                                ^

# https://github.com/afaerber/linux/commit/fa76fee43094640fbec4ac88b854e020=
f26970a8
git remote add afaerber https://github.com/afaerber/linux.git
git remote update afaerber
git checkout fa76fee43094640fbec4ac88b854e020f26970a8
vim +25 drivers/soc/realtek/sb2.c

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  20  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  21  static irqreturn_t rtd_s=
b2_handle_irq(int irq, void *base)
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  22  {
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  23  	u32 val;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  24  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06 @25  	val =3D readl_relaxed(b=
ase + SB2_DBG_INT);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  26  	pr_info("sb2 interrupt =
0x%0x08x\n", val);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  27  	if (val & (SB2_DBG_INT_=
ACPU_INT | SB2_DBG_INT_SCPU_INT | SB2_DBG_INT_ACPU_NEG_INT | SB2_DBG_INT_SC=
PU_NEG_INT)) {
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  28  		u32 addr, cause;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  29  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  30  		writel_relaxed(SB2_DBG=
_INT_ACPU_INT_EN | SB2_DBG_INT_SCPU_INT_EN | SB2_DBG_INT_WRITE_DATA, base +=
 SB2_DBG_INT);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  31  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  32  		cause =3D readl_relaxe=
d(base + SB2_DBG_ADDR1);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  33  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  34  		if (val & SB2_DBG_INT_=
SCPU_INT) {
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  35  			addr =3D readl_relaxe=
d(base + SB2_DBG_ADDR_SYSTEM);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  36  			cause =3D (cause >> 2=
) & 0x3;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  37  		} else {
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  38  			addr =3D readl_relaxe=
d(base + SB2_DBG_ADDR_AUDIO);
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  39  			cause =3D (cause >> 4=
) & 0x3;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  40  		}
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  41  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  42  		pr_warn("Memory 0x%08x=
 trashed by %s with %s %s\n", addr,
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  43  			(val & SB2_DBG_INT_SC=
PU_INT) ? "SCPU" : "ACPU",
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  44  			(cause & 1) ? "D" : "=
I",
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  45  			(cause & 2) ? "W" : "=
R");
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  46  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  47  		return IRQ_HANDLED;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  48  	}
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  49  =

fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  50  	return IRQ_NONE;
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  51  }
fa76fee4309464 Andreas F=C3=A4rber 2017-08-06  52  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6373003560962339812==--

