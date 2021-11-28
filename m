Content-Type: multipart/mixed; boundary="===============2988882657980900703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.4 14396/19174] drivers/dma-buf/heaps/system_heap.c:351 system_heap_buf_free() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Date: Sun, 28 Nov 2021 20:18:36 +0800
Message-ID: <202111282034.ijpYWeg7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2988882657980900703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0bbc71d87f4dfd294d50875fcc92469938718dbe
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [14396/19174] ANDROID: dma=
-buf: system_heap: Add deferred freeing to the system heap
:::::: branch date: 3 days ago
:::::: commit date: 10 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20211128/202111282034.ijpYWeg7-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:351 system_heap_buf_free() error: buffe=
r overflow 'pools' 3 <=3D 3 (assuming for loop doesn't break)

vim +351 drivers/dma-buf/heaps/system_heap.c

44008f99d9ca07 John Stultz 2019-06-06  325  =

e3919bfeb0066a John Stultz 2020-12-09  326  static void system_heap_buf_fre=
e(struct deferred_freelist_item *item,
e3919bfeb0066a John Stultz 2020-12-09  327  				 enum df_reason reason)
fc004422dadc12 John Stultz 2020-09-25  328  {
e3919bfeb0066a John Stultz 2020-12-09  329  	struct system_heap_buffer *buf=
fer;
fc004422dadc12 John Stultz 2020-09-25  330  	struct sg_table *table;
fc004422dadc12 John Stultz 2020-09-25  331  	struct scatterlist *sg;
44008f99d9ca07 John Stultz 2019-06-06  332  	int i, j;
44008f99d9ca07 John Stultz 2019-06-06  333  =

e3919bfeb0066a John Stultz 2020-12-09  334  	buffer =3D container_of(item, =
struct system_heap_buffer, deferred_free);
44008f99d9ca07 John Stultz 2019-06-06  335  	/* Zero the buffer pages befor=
e adding back to the pool */
e3919bfeb0066a John Stultz 2020-12-09  336  	if (reason =3D=3D DF_NORMAL)
e3919bfeb0066a John Stultz 2020-12-09  337  		if (system_heap_zero_buffer(b=
uffer))
e3919bfeb0066a John Stultz 2020-12-09  338  			reason =3D DF_UNDER_PRESSURE=
; // On failure, just free
fc004422dadc12 John Stultz 2020-09-25  339  =

fc004422dadc12 John Stultz 2020-09-25  340  	table =3D &buffer->sg_table;
703f43c5810e08 John Stultz 2020-09-26  341  	for_each_sg(table->sgl, sg, ta=
ble->nents, i) {
703f43c5810e08 John Stultz 2020-09-26  342  		struct page *page =3D sg_page=
(sg);
703f43c5810e08 John Stultz 2020-09-26  343  =

e3919bfeb0066a John Stultz 2020-12-09  344  		if (reason =3D=3D DF_UNDER_PR=
ESSURE) {
e3919bfeb0066a John Stultz 2020-12-09  345  			__free_pages(page, compound_=
order(page));
e3919bfeb0066a John Stultz 2020-12-09  346  		} else {
44008f99d9ca07 John Stultz 2019-06-06  347  			for (j =3D 0; j < NUM_ORDERS=
; j++) {
44008f99d9ca07 John Stultz 2019-06-06  348  				if (compound_order(page) =
=3D=3D orders[j])
44008f99d9ca07 John Stultz 2019-06-06  349  					break;
44008f99d9ca07 John Stultz 2019-06-06  350  			}
44008f99d9ca07 John Stultz 2019-06-06 @351  			dmabuf_page_pool_free(pools[=
j], page);
703f43c5810e08 John Stultz 2020-09-26  352  		}
e3919bfeb0066a John Stultz 2020-12-09  353  	}
fc004422dadc12 John Stultz 2020-09-25  354  	sg_free_table(table);
c02e6ccc5a4aab John Stultz 2019-12-03  355  	kfree(buffer);
c02e6ccc5a4aab John Stultz 2019-12-03  356  }
c02e6ccc5a4aab John Stultz 2019-12-03  357  =


:::::: The code@line 351 was first introduced by commit
:::::: 44008f99d9ca0793e2562967e1da01fa74ee4a41 ANDROID: dma-buf: system_he=
ap: Add pagepool support to system heap

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2988882657980900703==--

