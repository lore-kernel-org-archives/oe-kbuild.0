Content-Type: multipart/mixed; boundary="===============1496397603340424498=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [afaerber:rtd1295-next 56/165] drivers/soc/realtek/scpu.c:38:53: warning: 'base' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
Date: Sun, 12 Apr 2020 20:22:01 +0800
Message-ID: <202004122058.svinZSpA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1496397603340424498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Andreas F=C3=A4rber" <afaerber@suse.de>

tree:   https://github.com/afaerber/linux.git rtd1295-next
head:   89dddc4c437454ce2c1df9bf0503a7efdfcf1102
commit: 62bd004892a855a166685474f518163ed46a083b [56/165] soc: realtek: Add=
 SCPU wrapper for RTD1295
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/soc/realtek/scpu.c:38:53: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    writel(BIT(13) | BIT(9) | DBG_CTRL_WRITE_EN1, base + DBG_CTRL + which *=
 4);
                                                       ^
   drivers/soc/realtek/scpu.c:38:64: warning: 'base+544' is of type 'void *=
'. When using void pointers in calculations, the behaviour is undefined. [a=
rithOperationsOnVoidPointer]
    writel(BIT(13) | BIT(9) | DBG_CTRL_WRITE_EN1, base + DBG_CTRL + which *=
 4);
                                                                  ^
   drivers/soc/realtek/scpu.c:45:21: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    writel(start, base + DBG_START + which * 4);
                       ^
   drivers/soc/realtek/scpu.c:45:33: warning: 'base+512' is of type 'void *=
'. When using void pointers in calculations, the behaviour is undefined. [a=
rithOperationsOnVoidPointer]
    writel(start, base + DBG_START + which * 4);
                                   ^
   drivers/soc/realtek/scpu.c:46:21: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    writel(end,   base + DBG_END + which * 4);
                       ^
   drivers/soc/realtek/scpu.c:46:31: warning: 'base+528' is of type 'void *=
'. When using void pointers in calculations, the behaviour is undefined. [a=
rithOperationsOnVoidPointer]
    writel(end,   base + DBG_END + which * 4);
                                 ^
   drivers/soc/realtek/scpu.c:47:21: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    writel(flags, base + DBG_CTRL + which * 4);
                       ^
   drivers/soc/realtek/scpu.c:47:32: warning: 'base+544' is of type 'void *=
'. When using void pointers in calculations, the behaviour is undefined. [a=
rithOperationsOnVoidPointer]
    writel(flags, base + DBG_CTRL + which * 4);
                                  ^
   drivers/soc/realtek/scpu.c:60:23: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    dbg_int =3D readl(base + DBG_INT);
                         ^
   drivers/soc/realtek/scpu.c:61:24: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    dbg_addr =3D readl(base + DBG_ADDR);
                          ^
   drivers/soc/realtek/scpu.c:62:25: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    dbg_addr1 =3D readl(base + DBG_ADDR1);
                           ^
   drivers/soc/realtek/scpu.c:65:81: warning: 'base' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
     writel(dbg_int & ~(DBG_INT_SCPU_INT_EN_M1 | DBG_INT_SCPU_NEG_INT_EN_M1=
), base + DBG_INT);
                                                                           =
        ^

# https://github.com/afaerber/linux/commit/62bd004892a855a166685474f518163e=
d46a083b
git remote add afaerber https://github.com/afaerber/linux.git
git remote update afaerber
git checkout 62bd004892a855a166685474f518163ed46a083b
vim +38 drivers/soc/realtek/scpu.c

62bd004892a855 Andreas F=C3=A4rber 2017-08-19  35  =

62bd004892a855 Andreas F=C3=A4rber 2017-08-19  36  static void rtd119x_scpu=
_dbg_disable_mem_monitor(void __iomem *base, int which)
62bd004892a855 Andreas F=C3=A4rber 2017-08-19  37  {
62bd004892a855 Andreas F=C3=A4rber 2017-08-19 @38  	writel(BIT(13) | BIT(9)=
 | DBG_CTRL_WRITE_EN1, base + DBG_CTRL + which * 4);
62bd004892a855 Andreas F=C3=A4rber 2017-08-19  39  }
62bd004892a855 Andreas F=C3=A4rber 2017-08-19  40  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1496397603340424498==--

