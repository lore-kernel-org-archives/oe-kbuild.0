Content-Type: multipart/mixed; boundary="===============7370967415163225203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-4.19 18/164] fs/exec.c:1842:15: warning: Local variable 'argv' shadows outer argument [shadowArgument]
Date: Mon, 06 Jun 2022 22:08:04 +0800
Message-ID: <202206062240.zoF0irVA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7370967415163225203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/exec.c=
:1842:15: warning: Local variable 'argv' shadows outer argument [shadowArgu=
ment]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-4.19
head:   e4eaf36c5d71f32b6c4b607b95ceb768bc1b12de
commit: b3dbc7283994baf2bb0cd9b44c9cc26a9a902071 [18/164] exec: Force singl=
e empty string when argv is empty
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b3dbc7283994baf2bb0cd9b44c9cc26a9a902071
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/dma/debug.c:486:6: warning: Local variable 'overlap' shadows oute=
r function [shadowFunction]
    int overlap =3D 0, i;
        ^
   kernel/dma/debug.c:1198:20: note: Shadowed declaration
   static inline bool overlap(void *addr, unsigned long len, void *start, v=
oid *end)
                      ^
   kernel/dma/debug.c:486:6: note: Shadow variable
    int overlap =3D 0, i;
        ^
   kernel/dma/debug.c:512:6: warning: Local variable 'overlap' shadows oute=
r function [shadowFunction]
    int overlap =3D active_cacheline_read_overlap(cln);
        ^
   kernel/dma/debug.c:1198:20: note: Shadowed declaration
   static inline bool overlap(void *addr, unsigned long len, void *start, v=
oid *end)
                      ^
   kernel/dma/debug.c:512:6: note: Shadow variable
    int overlap =3D active_cacheline_read_overlap(cln);
        ^
   kernel/dma/debug.c:529:6: warning: Local variable 'overlap' shadows oute=
r function [shadowFunction]
    int overlap =3D active_cacheline_read_overlap(cln);
        ^
   kernel/dma/debug.c:1198:20: note: Shadowed declaration
   static inline bool overlap(void *addr, unsigned long len, void *start, v=
oid *end)
                      ^
   kernel/dma/debug.c:529:6: note: Shadow variable
    int overlap =3D active_cacheline_read_overlap(cln);
        ^
>> kernel/dma/debug.c:421:45: warning: Parameter 'dev' can be declared with=
 const [constParameter]
   void debug_dma_dump_mappings(struct device *dev)
                                               ^
   kernel/dma/debug.c:943:50: warning: Parameter 'dev' can be declared with=
 const [constParameter]
   static int device_dma_allocations(struct device *dev, struct dma_debug_e=
ntry **out_entry)
                                                    ^
>> kernel/dma/debug.c:433:30: warning: Uninitialized variable: entry->dev [=
uninitvar]
      if (!dev || dev =3D=3D entry->dev) {
                                ^
   kernel/dma/debug.c:952:15: warning: Uninitialized variable: entry->dev [=
uninitvar]
      if (entry->dev =3D=3D dev) {
                 ^
>> kernel/dma/debug.c:1371:26: warning: Uninitialized variables: entry.list=
, entry.dev, entry.type, entry.pfn, entry.offset, entry.dev_addr, entry.siz=
e, entry.direction, entry.sg_call_ents, entry.sg_mapped_ents, entry.map_err=
_type [uninitvar]
     if (!exact_match(&ref, entry))
                            ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1371:26: note: Uninitialized variables: entry.list, e=
ntry.dev, entry.type, entry.pfn, entry.offset, entry.dev_addr, entry.size, =
entry.direction, entry.sg_call_ents, entry.sg_mapped_ents, entry.map_err_ty=
pe
     if (!exact_match(&ref, entry))
                            ^
   kernel/dma/debug.c:1371:26: warning: Uninitialized variables: entry.list=
, entry.dev, entry.type, entry.pfn, entry.offset, entry.dev_addr, entry.siz=
e, entry.direction, entry.sg_call_ents, entry.sg_mapped_ents, entry.map_err=
_type, entry.stacktrace [uninitvar]
     if (!exact_match(&ref, entry))
                            ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1363:14: note: Assuming condition is false
    if (unlikely(dma_debug_disabled()))
                ^
   kernel/dma/debug.c:1371:26: note: Uninitialized variables: entry.list, e=
ntry.dev, entry.type, entry.pfn, entry.offset, entry.dev_addr, entry.size, =
entry.direction, entry.sg_call_ents, entry.sg_mapped_ents, entry.map_err_ty=
pe, entry.stacktrace
     if (!exact_match(&ref, entry))
                            ^
--
>> fs/exec.c:1842:15: warning: Local variable 'argv' shadows outer argument=
 [shadowArgument]
     const char *argv[] =3D { "", NULL };
                 ^
   fs/exec.c:1725:28: note: Shadowed declaration
          struct user_arg_ptr argv,
                              ^
   fs/exec.c:1842:15: note: Shadow variable
     const char *argv[] =3D { "", NULL };
                 ^
>> fs/exec.c:209:6: warning: The if condition is the same as the previous i=
f condition [duplicateCondition]
    if (write)
        ^
   fs/exec.c:202:6: note: First condition
    if (write) {
        ^
   fs/exec.c:209:6: note: Second condition
    if (write)
        ^

vim +/argv +1842 fs/exec.c

5d1baf3b63bfc8 Oleg Nesterov      2013-09-11  1720  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1721  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1722   * sys_execve() execute=
s a new program.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723   */
449325b52b7a62 Alexei Starovoitov 2018-05-21  1724  static int __do_execve_=
file(int fd, struct filename *filename,
ba2d01629d0d16 Oleg Nesterov      2011-03-06  1725  			    struct user_arg_=
ptr argv,
51f39a1f0cea1c David Drysdale     2014-12-12  1726  			    struct user_arg_=
ptr envp,
449325b52b7a62 Alexei Starovoitov 2018-05-21  1727  			    int flags, struc=
t file *file)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1728  {
51f39a1f0cea1c David Drysdale     2014-12-12  1729  	char *pathbuf =3D NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1730  	struct linux_binprm *b=
prm;
3b1253880b7a9e Al Viro            2008-04-22  1731  	struct files_struct *d=
isplaced;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1732  	int retval;
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1733  =

c4ad8f98bef77c Linus Torvalds     2014-02-05  1734  	if (IS_ERR(filename))
c4ad8f98bef77c Linus Torvalds     2014-02-05  1735  		return PTR_ERR(filena=
me);
c4ad8f98bef77c Linus Torvalds     2014-02-05  1736  =

72fa59970f8698 Vasiliy Kulikov    2011-08-08  1737  	/*
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1738  	 * We move the actual =
failure in case of RLIMIT_NPROC excess from
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1739  	 * set*uid() to execve=
() because too many poorly written programs
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1740  	 * don't check setuid(=
) return code.  Here we additionally recheck
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1741  	 * whether NPROC limit=
 is still exceeded.
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1742  	 */
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1743  	if ((current->flags & =
PF_NPROC_EXCEEDED) &&
bd9d43f47d6944 Oleg Nesterov      2013-07-03  1744  	    atomic_read(&curre=
nt_user()->processes) > rlimit(RLIMIT_NPROC)) {
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1745  		retval =3D -EAGAIN;
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1746  		goto out_ret;
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1747  	}
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1748  =

72fa59970f8698 Vasiliy Kulikov    2011-08-08  1749  	/* We're below the lim=
it (still or again), so we don't want to make
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1750  	 * further execve() ca=
lls fail. */
72fa59970f8698 Vasiliy Kulikov    2011-08-08  1751  	current->flags &=3D ~P=
F_NPROC_EXCEEDED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1752  =

3b1253880b7a9e Al Viro            2008-04-22  1753  	retval =3D unshare_fil=
es(&displaced);
fd8328be874f41 Al Viro            2008-04-22  1754  	if (retval)
fd8328be874f41 Al Viro            2008-04-22  1755  		goto out_ret;
fd8328be874f41 Al Viro            2008-04-22  1756  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1757  	retval =3D -ENOMEM;
11b0b5abb2097a Oliver Neukum      2006-03-25  1758  	bprm =3D kzalloc(sizeo=
f(*bprm), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1759  	if (!bprm)
fd8328be874f41 Al Viro            2008-04-22  1760  		goto out_files;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1761  =

a2a8474c3fff88 Oleg Nesterov      2009-09-05  1762  	retval =3D prepare_bpr=
m_creds(bprm);
a2a8474c3fff88 Oleg Nesterov      2009-09-05  1763  	if (retval)
a6f76f23d297f7 David Howells      2008-11-14  1764  		goto out_free;
498052bba55eca Al Viro            2009-03-30  1765  =

9e00cdb091b008 Oleg Nesterov      2014-01-23  1766  	check_unsafe_exec(bprm=
);
a2a8474c3fff88 Oleg Nesterov      2009-09-05  1767  	current->in_execve =3D=
 1;
a6f76f23d297f7 David Howells      2008-11-14  1768  =

449325b52b7a62 Alexei Starovoitov 2018-05-21  1769  	if (!file)
51f39a1f0cea1c David Drysdale     2014-12-12  1770  		file =3D do_open_exec=
at(fd, filename, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1771  	retval =3D PTR_ERR(fil=
e);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1772  	if (IS_ERR(file))
498052bba55eca Al Viro            2009-03-30  1773  		goto out_unmark;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1774  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1775  	sched_exec();
^1da177e4c3f41 Linus Torvalds     2005-04-16  1776  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1777  	bprm->file =3D file;
449325b52b7a62 Alexei Starovoitov 2018-05-21  1778  	if (!filename) {
449325b52b7a62 Alexei Starovoitov 2018-05-21  1779  		bprm->filename =3D "n=
one";
449325b52b7a62 Alexei Starovoitov 2018-05-21  1780  	} else if (fd =3D=3D A=
T_FDCWD || filename->name[0] =3D=3D '/') {
51f39a1f0cea1c David Drysdale     2014-12-12  1781  		bprm->filename =3D fi=
lename->name;
51f39a1f0cea1c David Drysdale     2014-12-12  1782  	} else {
51f39a1f0cea1c David Drysdale     2014-12-12  1783  		if (filename->name[0]=
 =3D=3D '\0')
0ee931c4e31a5e Michal Hocko       2017-09-13  1784  			pathbuf =3D kasprint=
f(GFP_KERNEL, "/dev/fd/%d", fd);
51f39a1f0cea1c David Drysdale     2014-12-12  1785  		else
0ee931c4e31a5e Michal Hocko       2017-09-13  1786  			pathbuf =3D kasprint=
f(GFP_KERNEL, "/dev/fd/%d/%s",
51f39a1f0cea1c David Drysdale     2014-12-12  1787  					    fd, filename->=
name);
51f39a1f0cea1c David Drysdale     2014-12-12  1788  		if (!pathbuf) {
51f39a1f0cea1c David Drysdale     2014-12-12  1789  			retval =3D -ENOMEM;
51f39a1f0cea1c David Drysdale     2014-12-12  1790  			goto out_unmark;
51f39a1f0cea1c David Drysdale     2014-12-12  1791  		}
51f39a1f0cea1c David Drysdale     2014-12-12  1792  		/*
51f39a1f0cea1c David Drysdale     2014-12-12  1793  		 * Record that a name=
 derived from an O_CLOEXEC fd will be
51f39a1f0cea1c David Drysdale     2014-12-12  1794  		 * inaccessible after=
 exec. Relies on having exclusive access to
51f39a1f0cea1c David Drysdale     2014-12-12  1795  		 * current->files (du=
e to unshare_files above).
51f39a1f0cea1c David Drysdale     2014-12-12  1796  		 */
51f39a1f0cea1c David Drysdale     2014-12-12  1797  		if (close_on_exec(fd,=
 rcu_dereference_raw(current->files->fdt)))
51f39a1f0cea1c David Drysdale     2014-12-12  1798  			bprm->interp_flags |=
=3D BINPRM_FLAGS_PATH_INACCESSIBLE;
51f39a1f0cea1c David Drysdale     2014-12-12  1799  		bprm->filename =3D pa=
thbuf;
51f39a1f0cea1c David Drysdale     2014-12-12  1800  	}
51f39a1f0cea1c David Drysdale     2014-12-12  1801  	bprm->interp =3D bprm-=
>filename;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1802  =

b6a2fea39318e4 Ollie Wild         2007-07-19  1803  	retval =3D bprm_mm_ini=
t(bprm);
b6a2fea39318e4 Ollie Wild         2007-07-19  1804  	if (retval)
63e46b95e9eae1 Oleg Nesterov      2014-01-23  1805  		goto out_unmark;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1806  =

b6a2fea39318e4 Ollie Wild         2007-07-19  1807  	bprm->argc =3D count(a=
rgv, MAX_ARG_STRINGS);
b3dbc7283994ba Kees Cook          2022-01-31  1808  	if (bprm->argc =3D=3D =
0)
b3dbc7283994ba Kees Cook          2022-01-31  1809  		pr_warn_once("process=
 '%s' launched '%s' with NULL argv: empty string added\n",
b3dbc7283994ba Kees Cook          2022-01-31  1810  			     current->comm, =
bprm->filename);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1811  	if ((retval =3D bprm->=
argc) < 0)
a6f76f23d297f7 David Howells      2008-11-14  1812  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1813  =

b6a2fea39318e4 Ollie Wild         2007-07-19  1814  	bprm->envc =3D count(e=
nvp, MAX_ARG_STRINGS);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1815  	if ((retval =3D bprm->=
envc) < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1816  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1817  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1818  	retval =3D prepare_bin=
prm(bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1819  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1820  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1821  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1822  	retval =3D copy_string=
s_kernel(1, &bprm->filename, bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1823  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1824  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1825  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1826  	bprm->exec =3D bprm->p;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1827  	retval =3D copy_string=
s(bprm->envc, envp, bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1828  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1829  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1830  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1831  	retval =3D copy_string=
s(bprm->argc, argv, bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1832  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1833  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1834  =

b3dbc7283994ba Kees Cook          2022-01-31  1835  	/*
b3dbc7283994ba Kees Cook          2022-01-31  1836  	 * When argv is empty,=
 add an empty string ("") as argv[0] to
b3dbc7283994ba Kees Cook          2022-01-31  1837  	 * ensure confused use=
rspace programs that start processing
b3dbc7283994ba Kees Cook          2022-01-31  1838  	 * from argv[1] won't =
end up walking envp. See also
b3dbc7283994ba Kees Cook          2022-01-31  1839  	 * bprm_stack_limits().
b3dbc7283994ba Kees Cook          2022-01-31  1840  	 */
b3dbc7283994ba Kees Cook          2022-01-31  1841  	if (bprm->argc =3D=3D =
0) {
b3dbc7283994ba Kees Cook          2022-01-31 @1842  		const char *argv[] =
=3D { "", NULL };
b3dbc7283994ba Kees Cook          2022-01-31  1843  		retval =3D copy_strin=
gs_kernel(1, argv, bprm);
b3dbc7283994ba Kees Cook          2022-01-31  1844  		if (retval < 0)
b3dbc7283994ba Kees Cook          2022-01-31  1845  			goto out;
b3dbc7283994ba Kees Cook          2022-01-31  1846  		bprm->argc =3D 1;
b3dbc7283994ba Kees Cook          2022-01-31  1847  	}
b3dbc7283994ba Kees Cook          2022-01-31  1848  =

5d1baf3b63bfc8 Oleg Nesterov      2013-09-11  1849  	retval =3D exec_binprm=
(bprm);
a6f76f23d297f7 David Howells      2008-11-14  1850  	if (retval < 0)
a6f76f23d297f7 David Howells      2008-11-14  1851  		goto out;
a6f76f23d297f7 David Howells      2008-11-14  1852  =

a6f76f23d297f7 David Howells      2008-11-14  1853  	/* execve succeeded */
498052bba55eca Al Viro            2009-03-30  1854  	current->fs->in_exec =
=3D 0;
f9ce1f1cda8b73 Kentaro Takeda     2009-02-05  1855  	current->in_execve =3D=
 0;
a961e40917fb14 Mathieu Desnoyers  2017-10-19  1856  	membarrier_execve(curr=
ent);
d7822b1e24f2df Mathieu Desnoyers  2018-06-02  1857  	rseq_execve(current);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1858  	acct_update_integrals(=
current);
48046e092ad557 Jann Horn          2019-07-16  1859  	task_numa_free(current=
, false);
08a6fac1c63233 Al Viro            2008-05-10  1860  	free_bprm(bprm);
51f39a1f0cea1c David Drysdale     2014-12-12  1861  	kfree(pathbuf);
449325b52b7a62 Alexei Starovoitov 2018-05-21  1862  	if (filename)
c4ad8f98bef77c Linus Torvalds     2014-02-05  1863  		putname(filename);
3b1253880b7a9e Al Viro            2008-04-22  1864  	if (displaced)
3b1253880b7a9e Al Viro            2008-04-22  1865  		put_files_struct(disp=
laced);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1866  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1867  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1868  out:
3c77f845722158 Oleg Nesterov      2010-11-30  1869  	if (bprm->mm) {
3c77f845722158 Oleg Nesterov      2010-11-30  1870  		acct_arg_size(bprm, 0=
);
b6a2fea39318e4 Ollie Wild         2007-07-19  1871  		mmput(bprm->mm);
3c77f845722158 Oleg Nesterov      2010-11-30  1872  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1873  =

498052bba55eca Al Viro            2009-03-30  1874  out_unmark:
498052bba55eca Al Viro            2009-03-30  1875  	current->fs->in_exec =
=3D 0;
f9ce1f1cda8b73 Kentaro Takeda     2009-02-05  1876  	current->in_execve =3D=
 0;
a6f76f23d297f7 David Howells      2008-11-14  1877  =

a6f76f23d297f7 David Howells      2008-11-14  1878  out_free:
08a6fac1c63233 Al Viro            2008-05-10  1879  	free_bprm(bprm);
51f39a1f0cea1c David Drysdale     2014-12-12  1880  	kfree(pathbuf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1881  =

fd8328be874f41 Al Viro            2008-04-22  1882  out_files:
3b1253880b7a9e Al Viro            2008-04-22  1883  	if (displaced)
3b1253880b7a9e Al Viro            2008-04-22  1884  		reset_files_struct(di=
splaced);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1885  out_ret:
449325b52b7a62 Alexei Starovoitov 2018-05-21  1886  	if (filename)
c4ad8f98bef77c Linus Torvalds     2014-02-05  1887  		putname(filename);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1888  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1889  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1890  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7370967415163225203==--

