Content-Type: multipart/mixed; boundary="===============2863482929754519559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/shmem_utils.c:76:13: warning: Unsigned variable '--' can't be negative so it is unnecessary to test it.
Date: Thu, 29 Oct 2020 00:54:03 +0800
Message-ID: <202010290000.pgXQ1LCb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2863482929754519559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ed8780e3f2ecc82645342d070c6b4e530532e680
commit: bfed6708d6c97406d14420f3288ee775c284ff8a drm/i915: use vmap in shme=
m_pin_map
date:   10 days ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/gt/shmem_utils.c:76:13: warning: Unsigned variable =
'--' can't be negative so it is unnecessary to test it. [unsignedPositive]
    while (--i >=3D 0)
               ^

vim +76 drivers/gpu/drm/i915/gt/shmem_utils.c

be1cb55a07bfc5 Chris Wilson      2020-04-29  51  =

be1cb55a07bfc5 Chris Wilson      2020-04-29  52  void *shmem_pin_map(struct=
 file *file)
be1cb55a07bfc5 Chris Wilson      2020-04-29  53  {
bfed6708d6c974 Christoph Hellwig 2020-10-17  54  	struct page **pages;
bfed6708d6c974 Christoph Hellwig 2020-10-17  55  	size_t n_pages, i;
bfed6708d6c974 Christoph Hellwig 2020-10-17  56  	void *vaddr;
be1cb55a07bfc5 Chris Wilson      2020-04-29  57  =

bfed6708d6c974 Christoph Hellwig 2020-10-17  58  	n_pages =3D file->f_mappi=
ng->host->i_size >> PAGE_SHIFT;
bfed6708d6c974 Christoph Hellwig 2020-10-17  59  	pages =3D kvmalloc_array(=
n_pages, sizeof(*pages), GFP_KERNEL);
bfed6708d6c974 Christoph Hellwig 2020-10-17  60  	if (!pages)
be1cb55a07bfc5 Chris Wilson      2020-04-29  61  		return NULL;
be1cb55a07bfc5 Chris Wilson      2020-04-29  62  =

bfed6708d6c974 Christoph Hellwig 2020-10-17  63  	for (i =3D 0; i < n_pages=
; i++) {
bfed6708d6c974 Christoph Hellwig 2020-10-17  64  		pages[i] =3D shmem_read_=
mapping_page_gfp(file->f_mapping, i,
be1cb55a07bfc5 Chris Wilson      2020-04-29  65  						       GFP_KERNEL);
bfed6708d6c974 Christoph Hellwig 2020-10-17  66  		if (IS_ERR(pages[i]))
be1cb55a07bfc5 Chris Wilson      2020-04-29  67  			goto err_page;
be1cb55a07bfc5 Chris Wilson      2020-04-29  68  	}
be1cb55a07bfc5 Chris Wilson      2020-04-29  69  =

bfed6708d6c974 Christoph Hellwig 2020-10-17  70  	vaddr =3D vmap(pages, n_p=
ages, VM_MAP_PUT_PAGES, PAGE_KERNEL);
bfed6708d6c974 Christoph Hellwig 2020-10-17  71  	if (!vaddr)
bfed6708d6c974 Christoph Hellwig 2020-10-17  72  		goto err_page;
be1cb55a07bfc5 Chris Wilson      2020-04-29  73  	mapping_set_unevictable(f=
ile->f_mapping);
bfed6708d6c974 Christoph Hellwig 2020-10-17  74  	return vaddr;
be1cb55a07bfc5 Chris Wilson      2020-04-29  75  err_page:
bfed6708d6c974 Christoph Hellwig 2020-10-17 @76  	while (--i >=3D 0)
bfed6708d6c974 Christoph Hellwig 2020-10-17  77  		put_page(pages[i]);
bfed6708d6c974 Christoph Hellwig 2020-10-17  78  	kvfree(pages);
be1cb55a07bfc5 Chris Wilson      2020-04-29  79  	return NULL;
be1cb55a07bfc5 Chris Wilson      2020-04-29  80  }
be1cb55a07bfc5 Chris Wilson      2020-04-29  81  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2863482929754519559==--

