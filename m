Content-Type: multipart/mixed; boundary="===============6560117221117369811=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/cs5535audio/cs5535audio_pcm.c:136 cs5535audio_build_dma_packets() error: we previously assumed 'dma->desc_buf.area' could be null (see line 118)
Date: Thu, 24 Feb 2022 15:19:17 +0800
Message-ID: <202202241504.Ll6nkdGN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6560117221117369811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-m031-20220224 (https://download.01.org/0day-ci/arch=
ive/20220224/202202241504.Ll6nkdGN-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/pci/cs5535audio/cs5535audio_pcm.c:136 cs5535audio_build_dma_packets()=
 error: we previously assumed 'dma->desc_buf.area' could be null (see line =
118)

vim +136 sound/pci/cs5535audio/cs5535audio_pcm.c

9b4ffa48ae855c Jaya Kumar     2005-11-17  101  =

9b4ffa48ae855c Jaya Kumar     2005-11-17  102  #define CS5535AUDIO_DESC_LIS=
T_SIZE \
66f8df6bdd388d Takashi Iwai   2005-11-17  103  	PAGE_ALIGN(CS5535AUDIO_MAX_=
DESCRIPTORS * sizeof(struct cs5535audio_dma_desc))
9b4ffa48ae855c Jaya Kumar     2005-11-17  104  =

66f8df6bdd388d Takashi Iwai   2005-11-17  105  static int cs5535audio_build=
_dma_packets(struct cs5535audio *cs5535au,
66f8df6bdd388d Takashi Iwai   2005-11-17  106  					 struct cs5535audio_dma=
 *dma,
66f8df6bdd388d Takashi Iwai   2005-11-17  107  					 struct snd_pcm_substre=
am *substream,
9b4ffa48ae855c Jaya Kumar     2005-11-17  108  					 unsigned int periods,
9b4ffa48ae855c Jaya Kumar     2005-11-17  109  					 unsigned int period_by=
tes)
9b4ffa48ae855c Jaya Kumar     2005-11-17  110  {
9b4ffa48ae855c Jaya Kumar     2005-11-17  111  	unsigned int i;
9b4ffa48ae855c Jaya Kumar     2005-11-17  112  	u32 addr, desc_addr, jmpprd=
_addr;
66f8df6bdd388d Takashi Iwai   2005-11-17  113  	struct cs5535audio_dma_desc=
 *lastdesc;
9b4ffa48ae855c Jaya Kumar     2005-11-17  114  =

9b4ffa48ae855c Jaya Kumar     2005-11-17  115  	if (periods > CS5535AUDIO_M=
AX_DESCRIPTORS)
9b4ffa48ae855c Jaya Kumar     2005-11-17  116  		return -ENOMEM;
9b4ffa48ae855c Jaya Kumar     2005-11-17  117  =

9b4ffa48ae855c Jaya Kumar     2005-11-17 @118  	if (dma->desc_buf.area =3D=
=3D NULL) {
9b4ffa48ae855c Jaya Kumar     2005-11-17  119  		if (snd_dma_alloc_pages(SN=
DRV_DMA_TYPE_DEV,
6974f8ad449467 Takashi Iwai   2019-11-05  120  					&cs5535au->pci->dev,
9b4ffa48ae855c Jaya Kumar     2005-11-17  121  					CS5535AUDIO_DESC_LIST_S=
IZE+1,
9b4ffa48ae855c Jaya Kumar     2005-11-17  122  					&dma->desc_buf) < 0)
9b4ffa48ae855c Jaya Kumar     2005-11-17  123  			return -ENOMEM;
9b4ffa48ae855c Jaya Kumar     2005-11-17  124  		dma->period_bytes =3D dma-=
>periods =3D 0;
9b4ffa48ae855c Jaya Kumar     2005-11-17  125  	}
9b4ffa48ae855c Jaya Kumar     2005-11-17  126  =

9b4ffa48ae855c Jaya Kumar     2005-11-17  127  	if (dma->periods =3D=3D per=
iods && dma->period_bytes =3D=3D period_bytes)
9b4ffa48ae855c Jaya Kumar     2005-11-17  128  		return 0;
9b4ffa48ae855c Jaya Kumar     2005-11-17  129  =

d6e05edc59ecd7 Andreas Mohr   2006-06-26  130  	/* the u32 cast is okay bec=
ause in snd*create we successfully told
9b4ffa48ae855c Jaya Kumar     2005-11-17  131     	   pci alloc that we're =
only 32 bit capable so the uppper will be 0 */
9b4ffa48ae855c Jaya Kumar     2005-11-17  132  	addr =3D (u32) substream->r=
untime->dma_addr;
9b4ffa48ae855c Jaya Kumar     2005-11-17  133  	desc_addr =3D (u32) dma->de=
sc_buf.addr;
9b4ffa48ae855c Jaya Kumar     2005-11-17  134  	for (i =3D 0; i < periods; =
i++) {
66f8df6bdd388d Takashi Iwai   2005-11-17  135  		struct cs5535audio_dma_des=
c *desc =3D
66f8df6bdd388d Takashi Iwai   2005-11-17 @136  			&((struct cs5535audio_dma=
_desc *) dma->desc_buf.area)[i];
9b4ffa48ae855c Jaya Kumar     2005-11-17  137  		desc->addr =3D cpu_to_le32=
(addr);
27533df80e93dc Dan Carpenter  2011-11-20  138  		desc->size =3D cpu_to_le16=
(period_bytes);
71276410e17653 Takashi Iwai   2011-06-30  139  		desc->ctlreserved =3D cpu_=
to_le16(PRD_EOP);
66f8df6bdd388d Takashi Iwai   2005-11-17  140  		desc_addr +=3D sizeof(stru=
ct cs5535audio_dma_desc);
9b4ffa48ae855c Jaya Kumar     2005-11-17  141  		addr +=3D period_bytes;
9b4ffa48ae855c Jaya Kumar     2005-11-17  142  	}
9b4ffa48ae855c Jaya Kumar     2005-11-17  143  	/* we reserved one dummy de=
scriptor at the end to do the PRD jump */
66f8df6bdd388d Takashi Iwai   2005-11-17  144  	lastdesc =3D &((struct cs55=
35audio_dma_desc *) dma->desc_buf.area)[periods];
9b4ffa48ae855c Jaya Kumar     2005-11-17  145  	lastdesc->addr =3D cpu_to_l=
e32((u32) dma->desc_buf.addr);
9b4ffa48ae855c Jaya Kumar     2005-11-17  146  	lastdesc->size =3D 0;
71276410e17653 Takashi Iwai   2011-06-30  147  	lastdesc->ctlreserved =3D c=
pu_to_le16(PRD_JMP);
69756930f2de04 Takashi Iwai   2018-07-25  148  	jmpprd_addr =3D (u32)dma->d=
esc_buf.addr +
69756930f2de04 Takashi Iwai   2018-07-25  149  		sizeof(struct cs5535audio_=
dma_desc) * periods;
9b4ffa48ae855c Jaya Kumar     2005-11-17  150  =

7abcacb09ac0f9 Andres Salomon 2007-09-03  151  	dma->substream =3D substrea=
m;
9b4ffa48ae855c Jaya Kumar     2005-11-17  152  	dma->period_bytes =3D perio=
d_bytes;
9b4ffa48ae855c Jaya Kumar     2005-11-17  153  	dma->periods =3D periods;
9b4ffa48ae855c Jaya Kumar     2005-11-17  154  	spin_lock_irq(&cs5535au->re=
g_lock);
9b4ffa48ae855c Jaya Kumar     2005-11-17  155  	dma->ops->disable_dma(cs553=
5au);
9b4ffa48ae855c Jaya Kumar     2005-11-17  156  	dma->ops->setup_prd(cs5535a=
u, jmpprd_addr);
9b4ffa48ae855c Jaya Kumar     2005-11-17  157  	spin_unlock_irq(&cs5535au->=
reg_lock);
9b4ffa48ae855c Jaya Kumar     2005-11-17  158  	return 0;
9b4ffa48ae855c Jaya Kumar     2005-11-17  159  }
9b4ffa48ae855c Jaya Kumar     2005-11-17  160  =


:::::: The code at line 136 was first introduced by commit
:::::: 66f8df6bdd388d209c38197785148c994c8a738d [ALSA] Remove xxx_t typedef=
s: PCI CS5535

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6560117221117369811==--

