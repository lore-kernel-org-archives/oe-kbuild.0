Content-Type: multipart/mixed; boundary="===============7427117582985238376=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/pcm_memory.c:379:26: warning: Either the condition '!substream' is redundant or there is possible null pointer dereference: substream.
Date: Thu, 06 Aug 2020 09:15:16 +0800
Message-ID: <202008060904.GsBssehg%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7427117582985238376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ecfd7940b8641da6e41ca94eba36876dc2ba827b
commit: d4cfb30fce03093ad944e0b44bd8f40bdad5330e ALSA: pcm: Set per-card up=
per limit of PCM buffer allocations
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/core/pcm_memory.c:379:26: warning: Either the condition '!substrea=
m' is redundant or there is possible null pointer dereference: substream. [=
nullPointerRedundantCheck]
    struct snd_card *card =3D substream->pcm->card;
                            ^
   sound/core/pcm_memory.c:383:6: note: Assuming that condition '!substream=
' is not redundant
    if (PCM_RUNTIME_CHECK(substream))
        ^
   sound/core/pcm_memory.c:379:26: note: Null pointer dereference
    struct snd_card *card =3D substream->pcm->card;
                            ^
   sound/core/pcm_memory.c:432:26: warning: Either the condition '!substrea=
m' is redundant or there is possible null pointer dereference: substream. [=
nullPointerRedundantCheck]
    struct snd_card *card =3D substream->pcm->card;
                            ^
   sound/core/pcm_memory.c:435:6: note: Assuming that condition '!substream=
' is not redundant
    if (PCM_RUNTIME_CHECK(substream))
        ^
   sound/core/pcm_memory.c:432:26: note: Null pointer dereference
    struct snd_card *card =3D substream->pcm->card;
                            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd4cfb30fce03093ad944e0b44bd8f40bdad5330e
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout d4cfb30fce03093ad944e0b44bd8f40bdad5330e
vim +379 sound/core/pcm_memory.c

51e9f2e665bf2b Takashi Iwai   2008-07-30  365  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  366  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  367   * snd_pcm_lib_malloc_pages =
- allocate the DMA buffer
^1da177e4c3f41 Linus Torvalds 2005-04-16  368   * @substream: the substream=
 to allocate the DMA buffer to
^1da177e4c3f41 Linus Torvalds 2005-04-16  369   * @size: the requested buff=
er size in bytes
^1da177e4c3f41 Linus Torvalds 2005-04-16  370   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  371   * Allocates the DMA buffer =
on the BUS type given earlier to
^1da177e4c3f41 Linus Torvalds 2005-04-16  372   * snd_pcm_lib_preallocate_x=
xx_pages().
^1da177e4c3f41 Linus Torvalds 2005-04-16  373   *
eb7c06e8e9c93b Yacine Belkadi 2013-03-11  374   * Return: 1 if the buffer i=
s changed, 0 if not changed, or a negative
^1da177e4c3f41 Linus Torvalds 2005-04-16  375   * code on failure.
^1da177e4c3f41 Linus Torvalds 2005-04-16  376   */
877211f5e1b119 Takashi Iwai   2005-11-17  377  int snd_pcm_lib_malloc_pages=
(struct snd_pcm_substream *substream, size_t size)
^1da177e4c3f41 Linus Torvalds 2005-04-16  378  {
d4cfb30fce0309 Takashi Iwai   2020-01-20 @379  	struct snd_card *card =3D s=
ubstream->pcm->card;
877211f5e1b119 Takashi Iwai   2005-11-17  380  	struct snd_pcm_runtime *run=
time;
^1da177e4c3f41 Linus Torvalds 2005-04-16  381  	struct snd_dma_buffer *dmab=
 =3D NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  382  =

7eaa943c8ed8e9 Takashi Iwai   2008-08-08  383  	if (PCM_RUNTIME_CHECK(subst=
ream))
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  384  		return -EINVAL;
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  385  	if (snd_BUG_ON(substream->d=
ma_buffer.dev.type =3D=3D
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  386  		       SNDRV_DMA_TYPE_UNKN=
OWN))
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  387  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  388  	runtime =3D substream->runt=
ime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  389  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  390  	if (runtime->dma_buffer_p) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  391  		/* perphaps, we might free=
 the large DMA memory region
^1da177e4c3f41 Linus Torvalds 2005-04-16  392  		   to save some space here=
, but the actual solution
^1da177e4c3f41 Linus Torvalds 2005-04-16  393  		   costs us less time */
^1da177e4c3f41 Linus Torvalds 2005-04-16  394  		if (runtime->dma_buffer_p-=
>bytes >=3D size) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  395  			runtime->dma_bytes =3D si=
ze;
^1da177e4c3f41 Linus Torvalds 2005-04-16  396  			return 0;	/* ok, do not c=
hange */
^1da177e4c3f41 Linus Torvalds 2005-04-16  397  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  398  		snd_pcm_lib_free_pages(sub=
stream);
^1da177e4c3f41 Linus Torvalds 2005-04-16  399  	}
877211f5e1b119 Takashi Iwai   2005-11-17  400  	if (substream->dma_buffer.a=
rea !=3D NULL &&
877211f5e1b119 Takashi Iwai   2005-11-17  401  	    substream->dma_buffer.b=
ytes >=3D size) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  402  		dmab =3D &substream->dma_b=
uffer; /* use the pre-allocated buffer */
^1da177e4c3f41 Linus Torvalds 2005-04-16  403  	} else {
ca2c0966562cfb Takashi Iwai   2005-09-09  404  		dmab =3D kzalloc(sizeof(*d=
mab), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  405  		if (! dmab)
^1da177e4c3f41 Linus Torvalds 2005-04-16  406  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  407  		dmab->dev =3D substream->d=
ma_buffer.dev;
d4cfb30fce0309 Takashi Iwai   2020-01-20  408  		if (do_alloc_pages(card,
d4cfb30fce0309 Takashi Iwai   2020-01-20  409  				   substream->dma_buffer=
.dev.type,
^1da177e4c3f41 Linus Torvalds 2005-04-16  410  				   substream->dma_buffer=
.dev.dev,
^1da177e4c3f41 Linus Torvalds 2005-04-16  411  				   size, dmab) < 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  412  			kfree(dmab);
^1da177e4c3f41 Linus Torvalds 2005-04-16  413  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  414  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  415  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  416  	snd_pcm_set_runtime_buffer(=
substream, dmab);
^1da177e4c3f41 Linus Torvalds 2005-04-16  417  	runtime->dma_bytes =3D size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  418  	return 1;			/* area was cha=
nged */
^1da177e4c3f41 Linus Torvalds 2005-04-16  419  }
e88e8ae639a490 Takashi Iwai   2006-04-28  420  EXPORT_SYMBOL(snd_pcm_lib_ma=
lloc_pages);
e88e8ae639a490 Takashi Iwai   2006-04-28  421  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7427117582985238376==--

