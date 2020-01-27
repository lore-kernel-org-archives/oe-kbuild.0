Content-Type: multipart/mixed; boundary="===============2324766292061432091=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mm: Add MREMAP_DONTUNMAP to mremap().
Date: Mon, 27 Jan 2020 07:46:25 +0300
Message-ID: <20200127044625.GI1870@kadam>
In-Reply-To: <20200123014627.71720-1-bgeffon@google.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2324766292061432091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Brian,

url:    https://github.com/0day-ci/linux/commits/Brian-Geffon/mm-Add-MREMAP=
_DONTUNMAP-to-mremap/20200125-013342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
4703d9119972bf586d2cca76ec6438f819ffa30e

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mremap.c:561 mremap_to() error: potentially dereferencing uninitialized =
'vma'.

# https://github.com/0day-ci/linux/commit/98663ca05501623c3da7f0f30be8ba7d6=
32cf010
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 98663ca05501623c3da7f0f30be8ba7d632cf010
vim +/vma +561 mm/mremap.c

81909b842107ef Michel Lespinasse  2013-02-22  506  static unsigned long mre=
map_to(unsigned long addr, unsigned long old_len,
72f87654c69690 Pavel Emelyanov    2017-02-22  507  		unsigned long new_addr=
, unsigned long new_len, bool *locked,
98663ca0550162 Brian Geffon       2020-01-22  508  		unsigned long flags, s=
truct vm_userfaultfd_ctx *uf,
b22823719302e8 Mike Rapoport      2017-08-02  509  		struct list_head *uf_u=
nmap_early,
897ab3e0c49e24 Mike Rapoport      2017-02-24  510  		struct list_head *uf_u=
nmap)
ecc1a8993751de Al Viro            2009-11-24  511  {
ecc1a8993751de Al Viro            2009-11-24  512  	struct mm_struct *mm =
=3D current->mm;
ecc1a8993751de Al Viro            2009-11-24  513  	struct vm_area_struct *=
vma;
ecc1a8993751de Al Viro            2009-11-24  514  	unsigned long ret =3D -=
EINVAL;
ecc1a8993751de Al Viro            2009-11-24  515  	unsigned long charged =
=3D 0;
097eed103862f9 Al Viro            2009-11-24  516  	unsigned long map_flags;
ecc1a8993751de Al Viro            2009-11-24  517  =

f19cb115a25f3f Alexander Kuleshov 2015-11-05  518  	if (offset_in_page(new_=
addr))
ecc1a8993751de Al Viro            2009-11-24  519  		goto out;
ecc1a8993751de Al Viro            2009-11-24  520  =

ecc1a8993751de Al Viro            2009-11-24  521  	if (new_len > TASK_SIZE=
 || new_addr > TASK_SIZE - new_len)
ecc1a8993751de Al Viro            2009-11-24  522  		goto out;
ecc1a8993751de Al Viro            2009-11-24  523  =

9943242ca46814 Oleg Nesterov      2015-09-04  524  	/* Ensure the old/new l=
ocations do not overlap */
9943242ca46814 Oleg Nesterov      2015-09-04  525  	if (addr + old_len > ne=
w_addr && new_addr + new_len > addr)
ecc1a8993751de Al Viro            2009-11-24  526  		goto out;
ecc1a8993751de Al Viro            2009-11-24  527  =

ea2c3f6f554561 Oscar Salvador     2019-03-05  528  	/*
ea2c3f6f554561 Oscar Salvador     2019-03-05  529  	 * move_vma() need us t=
o stay 4 maps below the threshold, otherwise
ea2c3f6f554561 Oscar Salvador     2019-03-05  530  	 * it will bail out at =
the very beginning.
ea2c3f6f554561 Oscar Salvador     2019-03-05  531  	 * That is a problem if=
 we have already unmaped the regions here
ea2c3f6f554561 Oscar Salvador     2019-03-05  532  	 * (new_addr, and old_a=
ddr), because userspace will not know the
ea2c3f6f554561 Oscar Salvador     2019-03-05  533  	 * state of the vma's a=
fter it gets -ENOMEM.
ea2c3f6f554561 Oscar Salvador     2019-03-05  534  	 * So, to avoid such sc=
enario we can pre-compute if the whole
ea2c3f6f554561 Oscar Salvador     2019-03-05  535  	 * operation has high c=
hances to success map-wise.
ea2c3f6f554561 Oscar Salvador     2019-03-05  536  	 * Worst-scenario case =
is when both vma's (new_addr and old_addr) get
ea2c3f6f554561 Oscar Salvador     2019-03-05  537  	 * split in 3 before un=
maping it.
ea2c3f6f554561 Oscar Salvador     2019-03-05  538  	 * That means 2 more ma=
ps (1 for each) to the ones we already hold.
ea2c3f6f554561 Oscar Salvador     2019-03-05  539  	 * Check whether curren=
t map count plus 2 still leads us to 4 maps below
ea2c3f6f554561 Oscar Salvador     2019-03-05  540  	 * the threshold, other=
wise return -ENOMEM here to be more safe.
ea2c3f6f554561 Oscar Salvador     2019-03-05  541  	 */
ea2c3f6f554561 Oscar Salvador     2019-03-05  542  	if ((mm->map_count + 2)=
 >=3D sysctl_max_map_count - 3)
ea2c3f6f554561 Oscar Salvador     2019-03-05  543  		return -ENOMEM;
ea2c3f6f554561 Oscar Salvador     2019-03-05  544  =

b22823719302e8 Mike Rapoport      2017-08-02  545  	ret =3D do_munmap(mm, n=
ew_addr, new_len, uf_unmap_early);
ecc1a8993751de Al Viro            2009-11-24  546  	if (ret)
ecc1a8993751de Al Viro            2009-11-24  547  		goto out;
ecc1a8993751de Al Viro            2009-11-24  548  =

ecc1a8993751de Al Viro            2009-11-24  549  	if (old_len >=3D new_le=
n) {
897ab3e0c49e24 Mike Rapoport      2017-02-24  550  		ret =3D do_munmap(mm, =
addr+new_len, old_len - new_len, uf_unmap);
ecc1a8993751de Al Viro            2009-11-24  551  		if (ret && old_len !=
=3D new_len)
ecc1a8993751de Al Viro            2009-11-24  552  			goto out;
ecc1a8993751de Al Viro            2009-11-24  553  		old_len =3D new_len;
ecc1a8993751de Al Viro            2009-11-24  554  	}
ecc1a8993751de Al Viro            2009-11-24  555  =

98663ca0550162 Brian Geffon       2020-01-22  556  	/*
98663ca0550162 Brian Geffon       2020-01-22  557  	 * MREMAP_DONTUNMAP exp=
ands by old_len + (new_len - old_len), we will
98663ca0550162 Brian Geffon       2020-01-22  558  	 * check that we can ex=
pand by old_len and vma_to_resize will handle
98663ca0550162 Brian Geffon       2020-01-22  559  	 * the vma growing.
98663ca0550162 Brian Geffon       2020-01-22  560  	 */
98663ca0550162 Brian Geffon       2020-01-22 @561  	if (unlikely(flags & MR=
EMAP_DONTUNMAP && !may_expand_vm(mm,
98663ca0550162 Brian Geffon       2020-01-22  562  				vma->vm_flags, old_l=
en >> PAGE_SHIFT))) {
                                                                           =
     ^^^^^^^^^^^^^

98663ca0550162 Brian Geffon       2020-01-22  563  		ret =3D -ENOMEM;
98663ca0550162 Brian Geffon       2020-01-22  564  		goto out;
98663ca0550162 Brian Geffon       2020-01-22  565  	}
98663ca0550162 Brian Geffon       2020-01-22  566  =

ecc1a8993751de Al Viro            2009-11-24  567  	vma =3D vma_to_resize(a=
ddr, old_len, new_len, &charged);
                                                        ^^^^^^^^^^^^^^^^^^^^

ecc1a8993751de Al Viro            2009-11-24  568  	if (IS_ERR(vma)) {
ecc1a8993751de Al Viro            2009-11-24  569  		ret =3D PTR_ERR(vma);
ecc1a8993751de Al Viro            2009-11-24  570  		goto out;
ecc1a8993751de Al Viro            2009-11-24  571  	}
ecc1a8993751de Al Viro            2009-11-24  572  =

097eed103862f9 Al Viro            2009-11-24  573  	map_flags =3D MAP_FIXED;

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2324766292061432091==--

