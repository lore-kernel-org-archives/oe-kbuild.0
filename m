Content-Type: multipart/mixed; boundary="===============2449608364302802742=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH V4 1/1] swiotlb: Split up single swiotlb lock
Date: Wed, 29 Jun 2022 06:18:00 +0800
Message-ID: <202206290648.EDU4wqJI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2449608364302802742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220617144741.921308-1-ltykernel@gmail.com>
References: <20220617144741.921308-1-ltykernel@gmail.com>
TO: Tianyu Lan <ltykernel@gmail.com>

Hi Tianyu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v5.19-rc4 next-20220628]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/swiotlb-S=
plit-up-single-swiotlb-lock/20220618-010819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-m001-20220627 (https://download.01.org/0day-ci/ar=
chive/20220629/202206290648.EDU4wqJI-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/dma/swiotlb.c:956 rmem_swiotlb_device_init() error: dereferencing fr=
eed memory 'mem'

vim +/mem +956 kernel/dma/swiotlb.c

f4111e39a52aa5d Claire Chang      2021-06-19  926  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  927  static int rmem_swiotlb_=
device_init(struct reserved_mem *rmem,
0b84e4f8b793eb4 Claire Chang      2021-06-19  928  				    struct device *d=
ev)
0b84e4f8b793eb4 Claire Chang      2021-06-19  929  {
0b84e4f8b793eb4 Claire Chang      2021-06-19  930  	struct io_tlb_mem *mem =
=3D rmem->priv;
0b84e4f8b793eb4 Claire Chang      2021-06-19  931  	unsigned long nslabs =
=3D rmem->size >> IO_TLB_SHIFT;
0b84e4f8b793eb4 Claire Chang      2021-06-19  932  =

47bb420a6670ad3 Tianyu Lan        2022-06-17  933  	/* Set Per-device io tl=
b area to one */
47bb420a6670ad3 Tianyu Lan        2022-06-17  934  	unsigned int nareas =3D=
 1;
47bb420a6670ad3 Tianyu Lan        2022-06-17  935  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  936  	/*
0b84e4f8b793eb4 Claire Chang      2021-06-19  937  	 * Since multiple devic=
es can share the same pool, the private data,
0b84e4f8b793eb4 Claire Chang      2021-06-19  938  	 * io_tlb_mem struct, w=
ill be initialized by the first device attached
0b84e4f8b793eb4 Claire Chang      2021-06-19  939  	 * to it.
0b84e4f8b793eb4 Claire Chang      2021-06-19  940  	 */
0b84e4f8b793eb4 Claire Chang      2021-06-19  941  	if (!mem) {
463e862ac63ef27 Will Deacon       2021-07-20  942  		mem =3D kzalloc(sizeof=
(*mem), GFP_KERNEL);
0b84e4f8b793eb4 Claire Chang      2021-06-19  943  		if (!mem)
0b84e4f8b793eb4 Claire Chang      2021-06-19  944  			return -ENOMEM;
0b84e4f8b793eb4 Claire Chang      2021-06-19  945  =

404f9373c4e5c94 Robin Murphy      2022-01-24  946  		mem->slots =3D kcalloc=
(nslabs, sizeof(*mem->slots), GFP_KERNEL);
463e862ac63ef27 Will Deacon       2021-07-20  947  		if (!mem->slots) {
463e862ac63ef27 Will Deacon       2021-07-20  948  			kfree(mem);
463e862ac63ef27 Will Deacon       2021-07-20  949  			return -ENOMEM;
463e862ac63ef27 Will Deacon       2021-07-20  950  		}
463e862ac63ef27 Will Deacon       2021-07-20  951  =

47bb420a6670ad3 Tianyu Lan        2022-06-17  952  		mem->areas =3D kcalloc=
(nareas, sizeof(*mem->areas),
47bb420a6670ad3 Tianyu Lan        2022-06-17  953  				     GFP_KERNEL);
47bb420a6670ad3 Tianyu Lan        2022-06-17  954  		if (!mem->areas) {
47bb420a6670ad3 Tianyu Lan        2022-06-17  955  			kfree(mem);
47bb420a6670ad3 Tianyu Lan        2022-06-17 @956  			kfree(mem->slots);
47bb420a6670ad3 Tianyu Lan        2022-06-17  957  			return -ENOMEM;
47bb420a6670ad3 Tianyu Lan        2022-06-17  958  		}
47bb420a6670ad3 Tianyu Lan        2022-06-17  959  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  960  		set_memory_decrypted((=
unsigned long)phys_to_virt(rmem->base),
0b84e4f8b793eb4 Claire Chang      2021-06-19  961  				     rmem->size >> P=
AGE_SHIFT);
e15db62bc5648ab Christoph Hellwig 2022-06-01  962  		swiotlb_init_io_tlb_me=
m(mem, rmem->base, nslabs, SWIOTLB_FORCE,
47bb420a6670ad3 Tianyu Lan        2022-06-17  963  					false, nareas);
0b84e4f8b793eb4 Claire Chang      2021-06-19  964  		mem->for_alloc =3D tru=
e;
0b84e4f8b793eb4 Claire Chang      2021-06-19  965  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  966  		rmem->priv =3D mem;
0b84e4f8b793eb4 Claire Chang      2021-06-19  967  =

35265899acef135 Robin Murphy      2022-01-24  968  		swiotlb_create_debugfs=
_files(mem, rmem->name);
0b84e4f8b793eb4 Claire Chang      2021-06-19  969  	}
0b84e4f8b793eb4 Claire Chang      2021-06-19  970  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  971  	dev->dma_io_tlb_mem =3D=
 mem;
0b84e4f8b793eb4 Claire Chang      2021-06-19  972  =

0b84e4f8b793eb4 Claire Chang      2021-06-19  973  	return 0;
0b84e4f8b793eb4 Claire Chang      2021-06-19  974  }
0b84e4f8b793eb4 Claire Chang      2021-06-19  975  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2449608364302802742==--

