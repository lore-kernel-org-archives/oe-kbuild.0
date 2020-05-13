Content-Type: multipart/mixed; boundary="===============4218267933842714387=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: android: ashmem: Fixed a issue related to file_operations
Date: Thu, 14 May 2020 05:56:13 +0800
Message-ID: <202005140556.iZTdRAYw%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4218267933842714387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200513114116.26410-1-user@debian>
References: <20200513114116.26410-1-user@debian>
TO: Anmol <anmol.karan123@gmail.com>
TO: gregkh(a)linuxfoundation.org
CC: devel(a)driverdev.osuosl.org
CC: linux-kernel(a)vger.kernel.org
CC: Anmol <anmol.karan123@gmail.com>

Hi Anmol,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v5.7-rc5 next-20200512]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Anmol/staging-android-ashm=
em-Fixed-a-issue-related-to-file_operations/20200513-194410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
1ff4388a06eb001efbc272754ef750c0b97817cb
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/android/ashmem.c:418:25: sparse: sparse: assignment to c=
onst expression
   drivers/staging/android/ashmem.c:419:36: sparse: sparse: assignment to c=
onst expression
   drivers/staging/android/ashmem.c:420:36: sparse: sparse: assignment to c=
onst expression

# https://github.com/0day-ci/linux/commit/823a00202dabb17bef093c5c29956b78f=
ae754f0
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 823a00202dabb17bef093c5c29956b78fae754f0
vim +418 drivers/staging/android/ashmem.c

6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  367  =

11980c2ac4ccfa Robert Love        2011-12-20  368  static int ashmem_mmap(s=
truct file *file, struct vm_area_struct *vma)
11980c2ac4ccfa Robert Love        2011-12-20  369  {
823a00202dabb1 Anmol              2020-05-13  370  	static const struct fil=
e_operations vmfile_fops;
11980c2ac4ccfa Robert Love        2011-12-20  371  	struct ashmem_area *asm=
a =3D file->private_data;
11980c2ac4ccfa Robert Love        2011-12-20  372  	int ret =3D 0;
11980c2ac4ccfa Robert Love        2011-12-20  373  =

11980c2ac4ccfa Robert Love        2011-12-20  374  	mutex_lock(&ashmem_mute=
x);
11980c2ac4ccfa Robert Love        2011-12-20  375  =

11980c2ac4ccfa Robert Love        2011-12-20  376  	/* user needs to SET_SI=
ZE before mapping */
59848d6aded59a Alistair Strachan  2018-06-19  377  	if (!asma->size) {
11980c2ac4ccfa Robert Love        2011-12-20  378  		ret =3D -EINVAL;
11980c2ac4ccfa Robert Love        2011-12-20  379  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  380  	}
11980c2ac4ccfa Robert Love        2011-12-20  381  =

8632c614565d0c Alistair Strachan  2018-06-19  382  	/* requested mapping si=
ze larger than object size */
8632c614565d0c Alistair Strachan  2018-06-19  383  	if (vma->vm_end - vma->=
vm_start > PAGE_ALIGN(asma->size)) {
11980c2ac4ccfa Robert Love        2011-12-20  384  		ret =3D -EINVAL;
11980c2ac4ccfa Robert Love        2011-12-20  385  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  386  	}
11980c2ac4ccfa Robert Love        2011-12-20  387  =

11980c2ac4ccfa Robert Love        2011-12-20  388  	/* requested protection=
 bits must match our allowed protection mask */
59848d6aded59a Alistair Strachan  2018-06-19  389  	if ((vma->vm_flags & ~c=
alc_vm_prot_bits(asma->prot_mask, 0)) &
59848d6aded59a Alistair Strachan  2018-06-19  390  	    calc_vm_prot_bits(P=
ROT_MASK, 0)) {
11980c2ac4ccfa Robert Love        2011-12-20  391  		ret =3D -EPERM;
11980c2ac4ccfa Robert Love        2011-12-20  392  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  393  	}
56f76fc68492af Arve Hj=C3=B8nnev=C3=A5g     2011-12-20  394  	vma->vm_flags=
 &=3D ~calc_vm_may_flags(~asma->prot_mask);
11980c2ac4ccfa Robert Love        2011-12-20  395  =

11980c2ac4ccfa Robert Love        2011-12-20  396  	if (!asma->file) {
11980c2ac4ccfa Robert Love        2011-12-20  397  		char *name =3D ASHMEM_=
NAME_DEF;
11980c2ac4ccfa Robert Love        2011-12-20  398  		struct file *vmfile;
11980c2ac4ccfa Robert Love        2011-12-20  399  =

11980c2ac4ccfa Robert Love        2011-12-20  400  		if (asma->name[ASHMEM_=
NAME_PREFIX_LEN] !=3D '\0')
11980c2ac4ccfa Robert Love        2011-12-20  401  			name =3D asma->name;
11980c2ac4ccfa Robert Love        2011-12-20  402  =

11980c2ac4ccfa Robert Love        2011-12-20  403  		/* ... and allocate th=
e backing shmem file */
11980c2ac4ccfa Robert Love        2011-12-20  404  		vmfile =3D shmem_file_=
setup(name, asma->size, vma->vm_flags);
7f44cb0ba88b40 Viresh Kumar       2015-07-31  405  		if (IS_ERR(vmfile)) {
11980c2ac4ccfa Robert Love        2011-12-20  406  			ret =3D PTR_ERR(vmfil=
e);
11980c2ac4ccfa Robert Love        2011-12-20  407  			goto out;
11980c2ac4ccfa Robert Love        2011-12-20  408  		}
97fbfef6bd5978 Shuxiao Zhang      2017-04-06  409  		vmfile->f_mode |=3D FM=
ODE_LSEEK;
11980c2ac4ccfa Robert Love        2011-12-20  410  		asma->file =3D vmfile;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  411  		/*
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  412  		 * override mmap opera=
tion of the vmfile so that it can't be
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  413  		 * remapped which woul=
d lead to creation of a new vma with no
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  414  		 * asma permission che=
cks. Have to override get_unmapped_area
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  415  		 * as well to prevent =
VM_BUG_ON check for f_ops modification.
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  416  		 */
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  417  		if (!vmfile_fops.mmap)=
 {
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27 @418  			vmfile_fops =3D *vmfi=
le->f_op;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  419  			vmfile_fops.mmap =3D =
ashmem_vmfile_mmap;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  420  			vmfile_fops.get_unmap=
ped_area =3D
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  421  					ashmem_vmfile_get_u=
nmapped_area;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  422  		}
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  423  		vmfile->f_op =3D &vmfi=
le_fops;
11980c2ac4ccfa Robert Love        2011-12-20  424  	}
11980c2ac4ccfa Robert Love        2011-12-20  425  	get_file(asma->file);
11980c2ac4ccfa Robert Love        2011-12-20  426  =

11980c2ac4ccfa Robert Love        2011-12-20  427  	/*
11980c2ac4ccfa Robert Love        2011-12-20  428  	 * XXX - Reworked to us=
e shmem_zero_setup() instead of
11980c2ac4ccfa Robert Love        2011-12-20  429  	 * shmem_set_file while=
 we're in staging. -jstultz
11980c2ac4ccfa Robert Love        2011-12-20  430  	 */
11980c2ac4ccfa Robert Love        2011-12-20  431  	if (vma->vm_flags & VM_=
SHARED) {
11980c2ac4ccfa Robert Love        2011-12-20  432  		ret =3D shmem_zero_set=
up(vma);
11980c2ac4ccfa Robert Love        2011-12-20  433  		if (ret) {
11980c2ac4ccfa Robert Love        2011-12-20  434  			fput(asma->file);
11980c2ac4ccfa Robert Love        2011-12-20  435  			goto out;
11980c2ac4ccfa Robert Love        2011-12-20  436  		}
44960f2a7b63e2 John Stultz        2018-07-31  437  	} else {
44960f2a7b63e2 John Stultz        2018-07-31  438  		vma_set_anonymous(vma);
11980c2ac4ccfa Robert Love        2011-12-20  439  	}
11980c2ac4ccfa Robert Love        2011-12-20  440  =

11980c2ac4ccfa Robert Love        2011-12-20  441  	if (vma->vm_file)
11980c2ac4ccfa Robert Love        2011-12-20  442  		fput(vma->vm_file);
11980c2ac4ccfa Robert Love        2011-12-20  443  	vma->vm_file =3D asma->=
file;
11980c2ac4ccfa Robert Love        2011-12-20  444  =

11980c2ac4ccfa Robert Love        2011-12-20  445  out:
11980c2ac4ccfa Robert Love        2011-12-20  446  	mutex_unlock(&ashmem_mu=
tex);
11980c2ac4ccfa Robert Love        2011-12-20  447  	return ret;
11980c2ac4ccfa Robert Love        2011-12-20  448  }
11980c2ac4ccfa Robert Love        2011-12-20  449  =


:::::: The code at line 418 was first introduced by commit
:::::: 6d67b0290b4b84c477e6a2fc6e005e174d3c7786 staging: android: ashmem: D=
isallow ashmem memory from being remapped

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4218267933842714387==--

