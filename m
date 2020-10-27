Content-Type: multipart/mixed; boundary="===============1821027143350382037=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/bus/mhi/core/boot.c:222:3: warning: Variable 'i' is modified but its new value is never used.
Date: Tue, 27 Oct 2020 10:02:26 +0300
Message-ID: <20201027070226.GI18329@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1821027143350382037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: cd457afb16670501f00354eb0e705a7d8a50d79d bus: mhi: core: Add suppor=
t for downloading firmware over BHIe
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bus/mhi/core/boot.c:222:3: warning: Variable 'i' is modified but=
 its new value is never used. [unreadVariable]
     i++;
     ^

vim +/i +222 drivers/bus/mhi/core/boot.c

cd457afb166705 Manivannan Sadhasivam 2020-02-20  203  static void mhi_firmw=
are_copy(struct mhi_controller *mhi_cntrl,
cd457afb166705 Manivannan Sadhasivam 2020-02-20  204  			      const struct=
 firmware *firmware,
cd457afb166705 Manivannan Sadhasivam 2020-02-20  205  			      struct image=
_info *img_info)
cd457afb166705 Manivannan Sadhasivam 2020-02-20  206  {
cd457afb166705 Manivannan Sadhasivam 2020-02-20  207  	size_t remainder =3D=
 firmware->size;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  208  	size_t to_cpy;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  209  	const u8 *buf =3D fi=
rmware->data;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  210  	int i =3D 0;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  211  	struct mhi_buf *mhi_=
buf =3D img_info->mhi_buf;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  212  	struct bhi_vec_entry=
 *bhi_vec =3D img_info->bhi_vec;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  213  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  214  	while (remainder) {
cd457afb166705 Manivannan Sadhasivam 2020-02-20  215  		to_cpy =3D min(rema=
inder, mhi_buf->len);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  216  		memcpy(mhi_buf->buf=
, buf, to_cpy);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  217  		bhi_vec->dma_addr =
=3D mhi_buf->dma_addr;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  218  		bhi_vec->size =3D t=
o_cpy;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  219  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  220  		buf +=3D to_cpy;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  221  		remainder -=3D to_c=
py;
cd457afb166705 Manivannan Sadhasivam 2020-02-20 @222  		i++;
                                                                ^^^^
Delete i.

cd457afb166705 Manivannan Sadhasivam 2020-02-20  223  		bhi_vec++;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  224  		mhi_buf++;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  225  	}
cd457afb166705 Manivannan Sadhasivam 2020-02-20  226  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============1821027143350382037==--

