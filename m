Content-Type: multipart/mixed; boundary="===============0719438503425076354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/sf-pdma/sf-pdma.c:58:6: warning: Either the condition 'chan' is redundant or there is possible null pointer dereference: chan.
Date: Fri, 18 Sep 2020 15:43:05 +0800
Message-ID: <202009181501.pNbVPdGa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0719438503425076354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Green Wan <green.wan@sifive.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   10b82d5176488acee2820e5a2cf0f2ec5c3488b6
commit: 6973886ad58e6b4988813331abb76ae0b364a9c2 dmaengine: sf-pdma: add pl=
atform DMA support for HiFive Unleashed A00
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/sf-pdma/sf-pdma.c:58:6: warning: Either the condition 'chan'=
 is redundant or there is possible null pointer dereference: chan. [nullPoi=
nterRedundantCheck]
    if (chan->desc && !chan->desc->in_use) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:97:6: note: Assuming that condition 'chan'=
 is not redundant
    if (chan && (!len || !dest || !src)) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:103:28: note: Calling function 'sf_pdma_al=
loc_desc', 1st argument 'chan' value is 0
    desc =3D sf_pdma_alloc_desc(chan);
                              ^
   drivers/dma/sf-pdma/sf-pdma.c:58:6: note: Null pointer dereference
    if (chan->desc && !chan->desc->in_use) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:112:2: warning: Either the condition 'chan=
' is redundant or there is possible null pointer dereference: chan. [nullPo=
interRedundantCheck]
    chan->desc =3D desc;
    ^
   drivers/dma/sf-pdma/sf-pdma.c:97:6: note: Assuming that condition 'chan'=
 is not redundant
    if (chan && (!len || !dest || !src)) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:112:2: note: Null pointer dereference
    chan->desc =3D desc;
    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D6973886ad58e6b4988813331abb76ae0b364a9c2
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 6973886ad58e6b4988813331abb76ae0b364a9c2
vim +/chan +58 drivers/dma/sf-pdma/sf-pdma.c

6973886ad58e6b4 Green Wan 2019-11-07  50  =

6973886ad58e6b4 Green Wan 2019-11-07  51  static struct sf_pdma_desc *sf_pd=
ma_alloc_desc(struct sf_pdma_chan *chan)
6973886ad58e6b4 Green Wan 2019-11-07  52  {
6973886ad58e6b4 Green Wan 2019-11-07  53  	struct sf_pdma_desc *desc;
6973886ad58e6b4 Green Wan 2019-11-07  54  	unsigned long flags;
6973886ad58e6b4 Green Wan 2019-11-07  55  =

6973886ad58e6b4 Green Wan 2019-11-07  56  	spin_lock_irqsave(&chan->lock, f=
lags);
6973886ad58e6b4 Green Wan 2019-11-07  57  =

6973886ad58e6b4 Green Wan 2019-11-07 @58  	if (chan->desc && !chan->desc->i=
n_use) {
6973886ad58e6b4 Green Wan 2019-11-07  59  		spin_unlock_irqrestore(&chan->l=
ock, flags);
6973886ad58e6b4 Green Wan 2019-11-07  60  		return chan->desc;
6973886ad58e6b4 Green Wan 2019-11-07  61  	}
6973886ad58e6b4 Green Wan 2019-11-07  62  =

6973886ad58e6b4 Green Wan 2019-11-07  63  	spin_unlock_irqrestore(&chan->lo=
ck, flags);
6973886ad58e6b4 Green Wan 2019-11-07  64  =

6973886ad58e6b4 Green Wan 2019-11-07  65  	desc =3D kzalloc(sizeof(*desc), =
GFP_NOWAIT);
6973886ad58e6b4 Green Wan 2019-11-07  66  	if (!desc)
6973886ad58e6b4 Green Wan 2019-11-07  67  		return NULL;
6973886ad58e6b4 Green Wan 2019-11-07  68  =

6973886ad58e6b4 Green Wan 2019-11-07  69  	desc->chan =3D chan;
6973886ad58e6b4 Green Wan 2019-11-07  70  =

6973886ad58e6b4 Green Wan 2019-11-07  71  	return desc;
6973886ad58e6b4 Green Wan 2019-11-07  72  }
6973886ad58e6b4 Green Wan 2019-11-07  73  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0719438503425076354==--

