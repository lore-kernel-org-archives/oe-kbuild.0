Content-Type: multipart/mixed; boundary="===============7443338765489264463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/nommu.c:924:4: warning: Assignment of function parameter has no effect outside the function.
Date: Sat, 31 Oct 2020 05:36:25 +0800
Message-ID: <202010310514.XvO5zRAe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7443338765489264463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   07e0887302450a62f51dba72df6afb5fabb23d1c
commit: 6bd33e1ece528f67646db33bf97406b747dafda0 riscv: add nommu support
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/nommu.c:924:4: warning: Assignment of function parameter has no effec=
t outside the function. [uselessAssignmentArg]
      prot |=3D PROT_EXEC;
      ^

vim +924 mm/nommu.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  775  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  776  /*
^1da177e4c3f415 Linus Torvalds    2005-04-16  777   * determine whether a m=
apping should be permitted and, if so, what sort of
^1da177e4c3f415 Linus Torvalds    2005-04-16  778   * mapping we're capable=
 of supporting
^1da177e4c3f415 Linus Torvalds    2005-04-16  779   */
^1da177e4c3f415 Linus Torvalds    2005-04-16  780  static int validate_mmap=
_request(struct file *file,
^1da177e4c3f415 Linus Torvalds    2005-04-16  781  				 unsigned long addr,
^1da177e4c3f415 Linus Torvalds    2005-04-16  782  				 unsigned long len,
^1da177e4c3f415 Linus Torvalds    2005-04-16  783  				 unsigned long prot,
^1da177e4c3f415 Linus Torvalds    2005-04-16  784  				 unsigned long flags,
^1da177e4c3f415 Linus Torvalds    2005-04-16  785  				 unsigned long pgoff,
^1da177e4c3f415 Linus Torvalds    2005-04-16  786  				 unsigned long *_cap=
abilities)
^1da177e4c3f415 Linus Torvalds    2005-04-16  787  {
8feae13110d60cc David Howells     2009-01-08  788  	unsigned long capabilit=
ies, rlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  789  	int ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  790  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  791  	/* do the simple checks=
 first */
22cc877b32202b6 Leon Romanovsky   2015-06-24  792  	if (flags & MAP_FIXED)
^1da177e4c3f415 Linus Torvalds    2005-04-16  793  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  794  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  795  	if ((flags & MAP_TYPE) =
!=3D MAP_PRIVATE &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  796  	    (flags & MAP_TYPE) =
!=3D MAP_SHARED)
^1da177e4c3f415 Linus Torvalds    2005-04-16  797  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  798  =

f81cff0d4067e41 Mike Frysinger    2006-12-06  799  	if (!len)
^1da177e4c3f415 Linus Torvalds    2005-04-16  800  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  801  =

f81cff0d4067e41 Mike Frysinger    2006-12-06  802  	/* Careful about overfl=
ows.. */
8feae13110d60cc David Howells     2009-01-08  803  	rlen =3D PAGE_ALIGN(len=
);
8feae13110d60cc David Howells     2009-01-08  804  	if (!rlen || rlen > TAS=
K_SIZE)
f81cff0d4067e41 Mike Frysinger    2006-12-06  805  		return -ENOMEM;
f81cff0d4067e41 Mike Frysinger    2006-12-06  806  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  807  	/* offset overflow? */
8feae13110d60cc David Howells     2009-01-08  808  	if ((pgoff + (rlen >> P=
AGE_SHIFT)) < pgoff)
f81cff0d4067e41 Mike Frysinger    2006-12-06  809  		return -EOVERFLOW;
^1da177e4c3f415 Linus Torvalds    2005-04-16  810  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  811  	if (file) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  812  		/* files must support =
mmap */
72c2d5319200484 Al Viro           2013-09-22  813  		if (!file->f_op->mmap)
^1da177e4c3f415 Linus Torvalds    2005-04-16  814  			return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16  815  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  816  		/* work out if what we=
've got could possibly be shared
^1da177e4c3f415 Linus Torvalds    2005-04-16  817  		 * - we support charde=
vs that provide their own "memory"
^1da177e4c3f415 Linus Torvalds    2005-04-16  818  		 * - we support files/=
blockdevs that are memory backed
^1da177e4c3f415 Linus Torvalds    2005-04-16  819  		 */
b4caecd48005fbe Christoph Hellwig 2015-01-14  820  		if (file->f_op->mmap_c=
apabilities) {
b4caecd48005fbe Christoph Hellwig 2015-01-14  821  			capabilities =3D file=
->f_op->mmap_capabilities(file);
b4caecd48005fbe Christoph Hellwig 2015-01-14  822  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  823  			/* no explicit capabi=
lities set, so assume some
^1da177e4c3f415 Linus Torvalds    2005-04-16  824  			 * defaults */
496ad9aa8ef4480 Al Viro           2013-01-23  825  			switch (file_inode(fi=
le)->i_mode & S_IFMT) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  826  			case S_IFREG:
^1da177e4c3f415 Linus Torvalds    2005-04-16  827  			case S_IFBLK:
b4caecd48005fbe Christoph Hellwig 2015-01-14  828  				capabilities =3D NOM=
MU_MAP_COPY;
^1da177e4c3f415 Linus Torvalds    2005-04-16  829  				break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  830  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  831  			case S_IFCHR:
^1da177e4c3f415 Linus Torvalds    2005-04-16  832  				capabilities =3D
b4caecd48005fbe Christoph Hellwig 2015-01-14  833  					NOMMU_MAP_DIRECT |
b4caecd48005fbe Christoph Hellwig 2015-01-14  834  					NOMMU_MAP_READ |
b4caecd48005fbe Christoph Hellwig 2015-01-14  835  					NOMMU_MAP_WRITE;
^1da177e4c3f415 Linus Torvalds    2005-04-16  836  				break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  837  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  838  			default:
^1da177e4c3f415 Linus Torvalds    2005-04-16  839  				return -EINVAL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  840  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  841  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  842  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  843  		/* eliminate any capab=
ilities that we can't support on this
^1da177e4c3f415 Linus Torvalds    2005-04-16  844  		 * device */
^1da177e4c3f415 Linus Torvalds    2005-04-16  845  		if (!file->f_op->get_u=
nmapped_area)
b4caecd48005fbe Christoph Hellwig 2015-01-14  846  			capabilities &=3D ~NO=
MMU_MAP_DIRECT;
6e242a1ceeb1bcf Al Viro           2015-03-31  847  		if (!(file->f_mode & F=
MODE_CAN_READ))
b4caecd48005fbe Christoph Hellwig 2015-01-14  848  			capabilities &=3D ~NO=
MMU_MAP_COPY;
^1da177e4c3f415 Linus Torvalds    2005-04-16  849  =

28d7a6ae92c099d Graff Yang        2009-08-18  850  		/* The file shall have=
 been opened with read permission. */
28d7a6ae92c099d Graff Yang        2009-08-18  851  		if (!(file->f_mode & F=
MODE_READ))
28d7a6ae92c099d Graff Yang        2009-08-18  852  			return -EACCES;
28d7a6ae92c099d Graff Yang        2009-08-18  853  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  854  		if (flags & MAP_SHARED=
) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  855  			/* do checks for writ=
ing, appending and locking */
^1da177e4c3f415 Linus Torvalds    2005-04-16  856  			if ((prot & PROT_WRIT=
E) &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  857  			    !(file->f_mode & =
FMODE_WRITE))
^1da177e4c3f415 Linus Torvalds    2005-04-16  858  				return -EACCES;
^1da177e4c3f415 Linus Torvalds    2005-04-16  859  =

496ad9aa8ef4480 Al Viro           2013-01-23  860  			if (IS_APPEND(file_in=
ode(file)) &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  861  			    (file->f_mode & F=
MODE_WRITE))
^1da177e4c3f415 Linus Torvalds    2005-04-16  862  				return -EACCES;
^1da177e4c3f415 Linus Torvalds    2005-04-16  863  =

d7a06983a01a336 Jeff Layton       2014-03-10  864  			if (locks_verify_lock=
ed(file))
^1da177e4c3f415 Linus Torvalds    2005-04-16  865  				return -EAGAIN;
^1da177e4c3f415 Linus Torvalds    2005-04-16  866  =

b4caecd48005fbe Christoph Hellwig 2015-01-14  867  			if (!(capabilities & =
NOMMU_MAP_DIRECT))
^1da177e4c3f415 Linus Torvalds    2005-04-16  868  				return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16  869  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  870  			/* we mustn't privati=
se shared mappings */
b4caecd48005fbe Christoph Hellwig 2015-01-14  871  			capabilities &=3D ~NO=
MMU_MAP_COPY;
ac7149045d9fcca Choi Gi-yong      2014-04-07  872  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  873  			/* we're going to rea=
d the file into private memory we
^1da177e4c3f415 Linus Torvalds    2005-04-16  874  			 * allocate */
b4caecd48005fbe Christoph Hellwig 2015-01-14  875  			if (!(capabilities & =
NOMMU_MAP_COPY))
^1da177e4c3f415 Linus Torvalds    2005-04-16  876  				return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16  877  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  878  			/* we don't permit a =
private writable mapping to be
^1da177e4c3f415 Linus Torvalds    2005-04-16  879  			 * shared with the ba=
cking device */
^1da177e4c3f415 Linus Torvalds    2005-04-16  880  			if (prot & PROT_WRITE)
b4caecd48005fbe Christoph Hellwig 2015-01-14  881  				capabilities &=3D ~N=
OMMU_MAP_DIRECT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  882  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  883  =

b4caecd48005fbe Christoph Hellwig 2015-01-14  884  		if (capabilities & NOM=
MU_MAP_DIRECT) {
b4caecd48005fbe Christoph Hellwig 2015-01-14  885  			if (((prot & PROT_REA=
D)  && !(capabilities & NOMMU_MAP_READ))  ||
b4caecd48005fbe Christoph Hellwig 2015-01-14  886  			    ((prot & PROT_WRI=
TE) && !(capabilities & NOMMU_MAP_WRITE)) ||
b4caecd48005fbe Christoph Hellwig 2015-01-14  887  			    ((prot & PROT_EXE=
C)  && !(capabilities & NOMMU_MAP_EXEC))
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  888  			    ) {
b4caecd48005fbe Christoph Hellwig 2015-01-14  889  				capabilities &=3D ~N=
OMMU_MAP_DIRECT;
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  890  				if (flags & MAP_SHAR=
ED) {
22cc877b32202b6 Leon Romanovsky   2015-06-24  891  					pr_warn("MAP_SHARED=
 not completely supported on !MMU\n");
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  892  					return -EINVAL;
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  893  				}
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  894  			}
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  895  		}
3c7b204547bc3d3 Bernd Schmidt     2010-05-25  896  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  897  		/* handle executable m=
appings and implied executable
^1da177e4c3f415 Linus Torvalds    2005-04-16  898  		 * mappings */
90f8572b0f021fd Eric W. Biederman 2015-06-29  899  		if (path_noexec(&file-=
>f_path)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  900  			if (prot & PROT_EXEC)
^1da177e4c3f415 Linus Torvalds    2005-04-16  901  				return -EPERM;
ac7149045d9fcca Choi Gi-yong      2014-04-07  902  		} else if ((prot & PRO=
T_READ) && !(prot & PROT_EXEC)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  903  			/* handle implication=
 of PROT_EXEC by PROT_READ */
^1da177e4c3f415 Linus Torvalds    2005-04-16  904  			if (current->personal=
ity & READ_IMPLIES_EXEC) {
b4caecd48005fbe Christoph Hellwig 2015-01-14  905  				if (capabilities & N=
OMMU_MAP_EXEC)
^1da177e4c3f415 Linus Torvalds    2005-04-16  906  					prot |=3D PROT_EXEC;
^1da177e4c3f415 Linus Torvalds    2005-04-16  907  			}
ac7149045d9fcca Choi Gi-yong      2014-04-07  908  		} else if ((prot & PRO=
T_READ) &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  909  			 (prot & PROT_EXEC) &&
b4caecd48005fbe Christoph Hellwig 2015-01-14  910  			 !(capabilities & NOM=
MU_MAP_EXEC)
^1da177e4c3f415 Linus Torvalds    2005-04-16  911  			 ) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  912  			/* backing file is no=
t executable, try to copy */
b4caecd48005fbe Christoph Hellwig 2015-01-14  913  			capabilities &=3D ~NO=
MMU_MAP_DIRECT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  914  		}
ac7149045d9fcca Choi Gi-yong      2014-04-07  915  	} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  916  		/* anonymous mappings =
are always memory backed and can be
^1da177e4c3f415 Linus Torvalds    2005-04-16  917  		 * privately mapped
^1da177e4c3f415 Linus Torvalds    2005-04-16  918  		 */
b4caecd48005fbe Christoph Hellwig 2015-01-14  919  		capabilities =3D NOMMU=
_MAP_COPY;
^1da177e4c3f415 Linus Torvalds    2005-04-16  920  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  921  		/* handle PROT_EXEC im=
plication by PROT_READ */
^1da177e4c3f415 Linus Torvalds    2005-04-16  922  		if ((prot & PROT_READ)=
 &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  923  		    (current->personal=
ity & READ_IMPLIES_EXEC))
^1da177e4c3f415 Linus Torvalds    2005-04-16 @924  			prot |=3D PROT_EXEC;
^1da177e4c3f415 Linus Torvalds    2005-04-16  925  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  926  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  927  	/* allow the security A=
PI to have its say */
e5467859f7f79b6 Al Viro           2012-05-30  928  	ret =3D security_mmap_a=
ddr(addr);
^1da177e4c3f415 Linus Torvalds    2005-04-16  929  	if (ret < 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  930  		return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  931  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  932  	/* looks okay */
^1da177e4c3f415 Linus Torvalds    2005-04-16  933  	*_capabilities =3D capa=
bilities;
^1da177e4c3f415 Linus Torvalds    2005-04-16  934  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  935  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  936  =


:::::: The code@line 924 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7443338765489264463==--

