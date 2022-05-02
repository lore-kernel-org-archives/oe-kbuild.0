Content-Type: multipart/mixed; boundary="===============6851751879446579881=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH V2 2/2] Swiotlb: Add device bounce buffer allocation interface
Date: Tue, 03 May 2022 03:56:08 +0800
Message-ID: <202205030322.WAeHGAi5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6851751879446579881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220502125436.23607-3-ltykernel@gmail.com>
References: <20220502125436.23607-3-ltykernel@gmail.com>
TO: Tianyu Lan <ltykernel@gmail.com>

Hi Tianyu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220429]
[cannot apply to linus/master v5.18-rc5 v5.18-rc4 v5.18-rc3 v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/swiotlb-A=
dd-child-io-tlb-mem-support/20220502-205700
base:    5469f0c06732a077c70a759a81f2a1f00b277694
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
503/202205030322.WAeHGAi5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/dma/swiotlb.c:1024:20-23: ERROR: reference preceded by free on li=
ne 1022

vim +1024 kernel/dma/swiotlb.c

3349f5b007cd7ec Tianyu Lan 2022-05-02   966  =

3349f5b007cd7ec Tianyu Lan 2022-05-02   967  /*
3349f5b007cd7ec Tianyu Lan 2022-05-02   968   * swiotlb_device_allocate - A=
llocate bounce buffer fo device from
3349f5b007cd7ec Tianyu Lan 2022-05-02   969   * default io tlb pool. The al=
location size should be aligned with
3349f5b007cd7ec Tianyu Lan 2022-05-02   970   * IO_TLB_BLOCK_UNIT.
3349f5b007cd7ec Tianyu Lan 2022-05-02   971   */
3349f5b007cd7ec Tianyu Lan 2022-05-02   972  int swiotlb_device_allocate(st=
ruct device *dev,
3349f5b007cd7ec Tianyu Lan 2022-05-02   973  			    unsigned int queue_num,
3349f5b007cd7ec Tianyu Lan 2022-05-02   974  			    unsigned long size)
3349f5b007cd7ec Tianyu Lan 2022-05-02   975  {
3349f5b007cd7ec Tianyu Lan 2022-05-02   976  	struct io_tlb_mem *mem, *pare=
nt_mem =3D dev->dma_io_tlb_mem;
3349f5b007cd7ec Tianyu Lan 2022-05-02   977  	unsigned long nslabs =3D ALIG=
N(size >> IO_TLB_SHIFT, IO_TLB_BLOCKSIZE);
3349f5b007cd7ec Tianyu Lan 2022-05-02   978  	struct page *page;
3349f5b007cd7ec Tianyu Lan 2022-05-02   979  	int ret =3D -ENOMEM;
3349f5b007cd7ec Tianyu Lan 2022-05-02   980  =

3349f5b007cd7ec Tianyu Lan 2022-05-02   981  	page =3D swiotlb_alloc_block(=
parent_mem, nslabs / IO_TLB_BLOCKSIZE);
3349f5b007cd7ec Tianyu Lan 2022-05-02   982  	if (!page)
3349f5b007cd7ec Tianyu Lan 2022-05-02   983  		return -ENOMEM;
3349f5b007cd7ec Tianyu Lan 2022-05-02   984  =

3349f5b007cd7ec Tianyu Lan 2022-05-02   985  	mem =3D kzalloc(sizeof(*mem),=
 GFP_KERNEL);
3349f5b007cd7ec Tianyu Lan 2022-05-02   986  	if (!mem)
3349f5b007cd7ec Tianyu Lan 2022-05-02   987  		goto error_mem;
3349f5b007cd7ec Tianyu Lan 2022-05-02   988  =

3349f5b007cd7ec Tianyu Lan 2022-05-02   989  	mem->slots =3D kzalloc(array_=
size(sizeof(*mem->slots), nslabs),
3349f5b007cd7ec Tianyu Lan 2022-05-02   990  			     GFP_KERNEL);
3349f5b007cd7ec Tianyu Lan 2022-05-02   991  	if (!mem->slots)
3349f5b007cd7ec Tianyu Lan 2022-05-02   992  		goto error_slots;
3349f5b007cd7ec Tianyu Lan 2022-05-02   993  =

3349f5b007cd7ec Tianyu Lan 2022-05-02   994  	mem->block =3D kcalloc(nslabs=
 / IO_TLB_BLOCKSIZE,
3349f5b007cd7ec Tianyu Lan 2022-05-02   995  				sizeof(struct io_tlb_block=
),
3349f5b007cd7ec Tianyu Lan 2022-05-02   996  				GFP_KERNEL);
3349f5b007cd7ec Tianyu Lan 2022-05-02   997  	if (!mem->block)
3349f5b007cd7ec Tianyu Lan 2022-05-02   998  		goto error_block;
3349f5b007cd7ec Tianyu Lan 2022-05-02   999  =

3349f5b007cd7ec Tianyu Lan 2022-05-02  1000  	mem->num_child =3D queue_num;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1001  	mem->child =3D kcalloc(queue_=
num,
3349f5b007cd7ec Tianyu Lan 2022-05-02  1002  				sizeof(struct io_tlb_mem),
3349f5b007cd7ec Tianyu Lan 2022-05-02  1003  				GFP_KERNEL);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1004  	if (!mem->child)
3349f5b007cd7ec Tianyu Lan 2022-05-02  1005  		goto error_child;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1006  =

3349f5b007cd7ec Tianyu Lan 2022-05-02  1007  =

3349f5b007cd7ec Tianyu Lan 2022-05-02  1008  	swiotlb_init_io_tlb_mem(mem, =
page_to_phys(page), nslabs, true);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1009  	mem->force_bounce =3D true;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1010  	mem->for_alloc =3D true;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1011  =

3349f5b007cd7ec Tianyu Lan 2022-05-02  1012  	mem->vaddr =3D parent_mem->va=
ddr + page_to_phys(page) -  parent_mem->start;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1013  	dev->dma_io_tlb_mem->parent =
=3D parent_mem;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1014  	dev->dma_io_tlb_mem =3D mem;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1015  	return 0;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1016  =

3349f5b007cd7ec Tianyu Lan 2022-05-02  1017  error_child:
3349f5b007cd7ec Tianyu Lan 2022-05-02  1018  	kfree(mem->block);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1019  error_block:
3349f5b007cd7ec Tianyu Lan 2022-05-02  1020  	kfree(mem->slots);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1021  error_slots:
3349f5b007cd7ec Tianyu Lan 2022-05-02 @1022  	kfree(mem);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1023  error_mem:
3349f5b007cd7ec Tianyu Lan 2022-05-02 @1024  	swiotlb_free_block(mem, page_=
to_phys(page), nslabs / IO_TLB_BLOCKSIZE);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1025  	return ret;
3349f5b007cd7ec Tianyu Lan 2022-05-02  1026  }
3349f5b007cd7ec Tianyu Lan 2022-05-02  1027  EXPORT_SYMBOL_GPL(swiotlb_devi=
ce_allocate);
3349f5b007cd7ec Tianyu Lan 2022-05-02  1028  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6851751879446579881==--

