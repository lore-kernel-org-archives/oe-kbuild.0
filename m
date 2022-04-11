Content-Type: multipart/mixed; boundary="===============1404279846182733711=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/memalloc.c:248 snd_dma_continuous_alloc() warn: should '((((mem_map + ((((p) >> 14)) - arch_pfn_offset))) - mem_map) + arch_pfn_offset) << 14' be a 64 bit type?
Date: Tue, 12 Apr 2022 00:19:05 +0800
Message-ID: <202204120055.f8zTqdSN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1404279846182733711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: f84ba106a0185b4336f58580bb016ce993962b0f ALSA: memalloc: Store snd_=
dma_buffer.addr for continuous pages, too
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204120055.f8zTqdSN-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/core/memalloc.c:248 snd_dma_continuous_alloc() warn: should '((((mem_=
map + ((((p) >> 14)) - arch_pfn_offset))) - mem_map) + arch_pfn_offset) << =
14' be a 64 bit type?

vim +248 sound/core/memalloc.c

37af81c5998f4b Takashi Iwai 2021-06-09  238  =

37af81c5998f4b Takashi Iwai 2021-06-09  239  /*
37af81c5998f4b Takashi Iwai 2021-06-09  240   * Continuous pages allocator
37af81c5998f4b Takashi Iwai 2021-06-09  241   */
723c1252e058dc Takashi Iwai 2021-08-02  242  static void *snd_dma_continuou=
s_alloc(struct snd_dma_buffer *dmab, size_t size)
37af81c5998f4b Takashi Iwai 2021-06-09  243  {
37af81c5998f4b Takashi Iwai 2021-06-09  244  	gfp_t gfp =3D snd_mem_get_gfp=
_flags(dmab, GFP_KERNEL);
f84ba106a0185b Takashi Iwai 2021-08-04  245  	void *p =3D alloc_pages_exact=
(size, gfp);
37af81c5998f4b Takashi Iwai 2021-06-09  246  =

f84ba106a0185b Takashi Iwai 2021-08-04  247  	if (p)
f84ba106a0185b Takashi Iwai 2021-08-04 @248  		dmab->addr =3D page_to_phys(=
virt_to_page(p));
f84ba106a0185b Takashi Iwai 2021-08-04  249  	return p;
37af81c5998f4b Takashi Iwai 2021-06-09  250  }
37af81c5998f4b Takashi Iwai 2021-06-09  251  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1404279846182733711==--

