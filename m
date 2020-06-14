Content-Type: multipart/mixed; boundary="===============3979396118556495356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 16135/16374] drivers/crypto/hisilicon/sgl.c:69:17: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Mon, 15 Jun 2020 00:43:27 +0800
Message-ID: <202006150023.Aj3ZjhMY%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3979396118556495356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   842221d073a88c9cd1aa01777c4b69020c28e7a4
commit: 184be75c04e981dc648296b62f867189f7c27d9c [16135/16374] crypto: hisi=
licon - Cap block size at 2^31
:::::: branch date: 11 hours ago
:::::: commit date: 3 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/crypto/hisilicon/sgl.c:69:17: warning: Shifting signed 32-bit va=
lue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    block_size =3D 1 << (PAGE_SHIFT + MAX_ORDER <=3D 32 ?
                   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D184be75c04e981dc648296b62f867189f7c27d9c
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 184be75c04e981dc648296b62f867189f7c27d9c
vim +69 drivers/crypto/hisilicon/sgl.c

48c1cd40fae31a Zhou Wang  2019-09-30   46  =

dfed0098ab91f6 Zhou Wang  2019-08-02   47  /**
dfed0098ab91f6 Zhou Wang  2019-08-02   48   * hisi_acc_create_sgl_pool() - =
Create a hw sgl pool.
dfed0098ab91f6 Zhou Wang  2019-08-02   49   * @dev: The device which hw sgl=
 pool belongs to.
dfed0098ab91f6 Zhou Wang  2019-08-02   50   * @count: Count of hisi_acc_hw_=
sgl in pool.
48c1cd40fae31a Zhou Wang  2019-09-30   51   * @sge_nr: The count of sge in =
hw_sgl
dfed0098ab91f6 Zhou Wang  2019-08-02   52   *
dfed0098ab91f6 Zhou Wang  2019-08-02   53   * This function creates a hw sg=
l pool, after this user can get hw sgl memory
dfed0098ab91f6 Zhou Wang  2019-08-02   54   * from it.
dfed0098ab91f6 Zhou Wang  2019-08-02   55   */
48c1cd40fae31a Zhou Wang  2019-09-30   56  struct hisi_acc_sgl_pool *hisi_a=
cc_create_sgl_pool(struct device *dev,
48c1cd40fae31a Zhou Wang  2019-09-30   57  						   u32 count, u32 sge_nr)
dfed0098ab91f6 Zhou Wang  2019-08-02   58  {
d8ac7b85236b04 Zhou Wang  2019-09-30   59  	u32 sgl_size, block_size, sgl_n=
um_per_block, block_num, remain_sgl =3D 0;
48c1cd40fae31a Zhou Wang  2019-09-30   60  	struct hisi_acc_sgl_pool *pool;
d8ac7b85236b04 Zhou Wang  2019-09-30   61  	struct mem_block *block;
d8ac7b85236b04 Zhou Wang  2019-09-30   62  	u32 i, j;
dfed0098ab91f6 Zhou Wang  2019-08-02   63  =

48c1cd40fae31a Zhou Wang  2019-09-30   64  	if (!dev || !count || !sge_nr |=
| sge_nr > HISI_ACC_SGL_SGE_NR_MAX)
48c1cd40fae31a Zhou Wang  2019-09-30   65  		return ERR_PTR(-EINVAL);
dfed0098ab91f6 Zhou Wang  2019-08-02   66  =

48c1cd40fae31a Zhou Wang  2019-09-30   67  	sgl_size =3D sizeof(struct acc_=
hw_sge) * sge_nr +
dfed0098ab91f6 Zhou Wang  2019-08-02   68  		   sizeof(struct hisi_acc_hw_s=
gl);
184be75c04e981 Herbert Xu 2020-06-04  @69  	block_size =3D 1 << (PAGE_SHIFT=
 + MAX_ORDER <=3D 32 ?
184be75c04e981 Herbert Xu 2020-06-04   70  			   PAGE_SHIFT + MAX_ORDER - 1=
 : 31);
d8ac7b85236b04 Zhou Wang  2019-09-30   71  	sgl_num_per_block =3D block_siz=
e / sgl_size;
d8ac7b85236b04 Zhou Wang  2019-09-30   72  	block_num =3D count / sgl_num_p=
er_block;
d8ac7b85236b04 Zhou Wang  2019-09-30   73  	remain_sgl =3D count % sgl_num_=
per_block;
d8ac7b85236b04 Zhou Wang  2019-09-30   74  =

d8ac7b85236b04 Zhou Wang  2019-09-30   75  	if ((!remain_sgl && block_num >=
 HISI_ACC_MEM_BLOCK_NR) ||
d8ac7b85236b04 Zhou Wang  2019-09-30   76  	    (remain_sgl > 0 && block_nu=
m > HISI_ACC_MEM_BLOCK_NR - 1))
d8ac7b85236b04 Zhou Wang  2019-09-30   77  		return ERR_PTR(-EINVAL);
dfed0098ab91f6 Zhou Wang  2019-08-02   78  =

48c1cd40fae31a Zhou Wang  2019-09-30   79  	pool =3D kzalloc(sizeof(*pool),=
 GFP_KERNEL);
48c1cd40fae31a Zhou Wang  2019-09-30   80  	if (!pool)
48c1cd40fae31a Zhou Wang  2019-09-30   81  		return ERR_PTR(-ENOMEM);
d8ac7b85236b04 Zhou Wang  2019-09-30   82  	block =3D pool->mem_block;
48c1cd40fae31a Zhou Wang  2019-09-30   83  =

d8ac7b85236b04 Zhou Wang  2019-09-30   84  	for (i =3D 0; i < block_num; i+=
+) {
d8ac7b85236b04 Zhou Wang  2019-09-30   85  		block[i].sgl =3D dma_alloc_coh=
erent(dev, block_size,
d8ac7b85236b04 Zhou Wang  2019-09-30   86  						  &block[i].sgl_dma,
d8ac7b85236b04 Zhou Wang  2019-09-30   87  						  GFP_KERNEL);
d8ac7b85236b04 Zhou Wang  2019-09-30   88  		if (!block[i].sgl)
d8ac7b85236b04 Zhou Wang  2019-09-30   89  			goto err_free_mem;
d8ac7b85236b04 Zhou Wang  2019-09-30   90  =

d8ac7b85236b04 Zhou Wang  2019-09-30   91  		block[i].size =3D block_size;
48c1cd40fae31a Zhou Wang  2019-09-30   92  	}
dfed0098ab91f6 Zhou Wang  2019-08-02   93  =

d8ac7b85236b04 Zhou Wang  2019-09-30   94  	if (remain_sgl > 0) {
d8ac7b85236b04 Zhou Wang  2019-09-30   95  		block[i].sgl =3D dma_alloc_coh=
erent(dev, remain_sgl * sgl_size,
d8ac7b85236b04 Zhou Wang  2019-09-30   96  						  &block[i].sgl_dma,
d8ac7b85236b04 Zhou Wang  2019-09-30   97  						  GFP_KERNEL);
d8ac7b85236b04 Zhou Wang  2019-09-30   98  		if (!block[i].sgl)
d8ac7b85236b04 Zhou Wang  2019-09-30   99  			goto err_free_mem;
d8ac7b85236b04 Zhou Wang  2019-09-30  100  =

d8ac7b85236b04 Zhou Wang  2019-09-30  101  		block[i].size =3D remain_sgl *=
 sgl_size;
d8ac7b85236b04 Zhou Wang  2019-09-30  102  	}
d8ac7b85236b04 Zhou Wang  2019-09-30  103  =

d8ac7b85236b04 Zhou Wang  2019-09-30  104  	pool->sgl_num_per_block =3D sgl=
_num_per_block;
d8ac7b85236b04 Zhou Wang  2019-09-30  105  	pool->block_num =3D remain_sgl =
? block_num + 1 : block_num;
dfed0098ab91f6 Zhou Wang  2019-08-02  106  	pool->count =3D count;
dfed0098ab91f6 Zhou Wang  2019-08-02  107  	pool->sgl_size =3D sgl_size;
48c1cd40fae31a Zhou Wang  2019-09-30  108  	pool->sge_nr =3D sge_nr;
dfed0098ab91f6 Zhou Wang  2019-08-02  109  =

48c1cd40fae31a Zhou Wang  2019-09-30  110  	return pool;
d8ac7b85236b04 Zhou Wang  2019-09-30  111  =

d8ac7b85236b04 Zhou Wang  2019-09-30  112  err_free_mem:
d8ac7b85236b04 Zhou Wang  2019-09-30  113  	for (j =3D 0; j < i; j++) {
d8ac7b85236b04 Zhou Wang  2019-09-30  114  		dma_free_coherent(dev, block_s=
ize, block[j].sgl,
d8ac7b85236b04 Zhou Wang  2019-09-30  115  				  block[j].sgl_dma);
d8ac7b85236b04 Zhou Wang  2019-09-30  116  		memset(block + j, 0, sizeof(*b=
lock));
d8ac7b85236b04 Zhou Wang  2019-09-30  117  	}
d8ac7b85236b04 Zhou Wang  2019-09-30  118  	kfree(pool);
d8ac7b85236b04 Zhou Wang  2019-09-30  119  	return ERR_PTR(-ENOMEM);
dfed0098ab91f6 Zhou Wang  2019-08-02  120  }
dfed0098ab91f6 Zhou Wang  2019-08-02  121  EXPORT_SYMBOL_GPL(hisi_acc_creat=
e_sgl_pool);
dfed0098ab91f6 Zhou Wang  2019-08-02  122  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3979396118556495356==--

