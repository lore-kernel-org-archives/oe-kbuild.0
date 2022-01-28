Content-Type: multipart/mixed; boundary="===============5459825560287375526=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:for-v5.18i 82/111] drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c:105:2-9: line 105 is redundant because platform_get_irq() already prints an error
Date: Fri, 28 Jan 2022 16:35:13 +0800
Message-ID: <202201281603.YgWZ0q17-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5459825560287375526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yunfei Dong <yunfei.dong@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Steve Cho <stevecho@chromium.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.18i
head:   232e2106ba4413aa88143fba77fd717b22169b10
commit: c05bada35f015fb735a9c3830226ccbe2b05008f [82/111] media: mtk-vcodec=
: Add to support multi hardware decode
:::::: branch date: 24 hours ago
:::::: commit date: 5 days ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220128=
/202201281603.YgWZ0q17-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c:105:2-9: line 105=
 is redundant because platform_get_irq() already prints an error
--
>> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c:102:2-9: line 102 =
is redundant because platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5459825560287375526==--

