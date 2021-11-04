Content-Type: multipart/mixed; boundary="===============3824936961486251288=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dhowells-fs:fscache-rewrite-indexing-3 43/55] fs/cachefiles/io.c:490:6: warning: Uninitialized variable: ret [uninitvar]
Date: Fri, 05 Nov 2021 04:02:26 +0800
Message-ID: <202111050401.6Yknm07v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3824936961486251288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it fscache-rewrite-indexing-3
head:   d2eff33286af9373ec469be3146d6e122c07264f
commit: 54975963cf72ae83b33bc4dd298e234976a7e4cd [43/55] cachefiles: Implem=
ent the I/O routines
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: hppa64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

           ^
   fs/cachefiles/io.c:397:35: note: Assignment 'to=3Dcachefiles_inject_read=
_error()', assigned value is 0
    to =3D cachefiles_inject_read_error();
                                     ^
   fs/cachefiles/io.c:398:9: note: Condition 'to=3D=3D0' is always true
    if (to =3D=3D 0)
           ^
>> fs/cachefiles/io.c:490:6: warning: Uninitialized variable: ret [uninitva=
r]
    if (ret < 0) {
        ^

vim +490 fs/cachefiles/io.c

54975963cf72ae David Howells 2021-10-21  427  =

54975963cf72ae David Howells 2021-10-21  428  /*
54975963cf72ae David Howells 2021-10-21  429   * Prepare for a write to occ=
ur.
54975963cf72ae David Howells 2021-10-21  430   */
54975963cf72ae David Howells 2021-10-21  431  static int __cachefiles_prepa=
re_write(struct netfs_cache_resources *cres,
54975963cf72ae David Howells 2021-10-21  432  				      loff_t *_start, siz=
e_t *_len, loff_t i_size,
54975963cf72ae David Howells 2021-10-21  433  				      bool no_space_alloc=
ated_yet)
54975963cf72ae David Howells 2021-10-21  434  {
54975963cf72ae David Howells 2021-10-21  435  	struct cachefiles_object *ob=
ject =3D cachefiles_cres_object(cres);
54975963cf72ae David Howells 2021-10-21  436  	struct cachefiles_cache *cac=
he =3D object->volume->cache;
54975963cf72ae David Howells 2021-10-21  437  	struct file *file =3D cachef=
iles_cres_file(cres);
54975963cf72ae David Howells 2021-10-21  438  	loff_t start =3D *_start, po=
s;
54975963cf72ae David Howells 2021-10-21  439  	size_t len =3D *_len, down;
54975963cf72ae David Howells 2021-10-21  440  	int ret;
54975963cf72ae David Howells 2021-10-21  441  =

54975963cf72ae David Howells 2021-10-21  442  	/* Round to DIO size */
54975963cf72ae David Howells 2021-10-21  443  	down =3D start - round_down(=
start, PAGE_SIZE);
54975963cf72ae David Howells 2021-10-21  444  	*_start =3D start - down;
54975963cf72ae David Howells 2021-10-21  445  	*_len =3D round_up(down + le=
n, PAGE_SIZE);
54975963cf72ae David Howells 2021-10-21  446  =

54975963cf72ae David Howells 2021-10-21  447  	/* We need to work out wheth=
er there's sufficient disk space to perform
54975963cf72ae David Howells 2021-10-21  448  	 * the write - but we can sk=
ip that check if we have space already
54975963cf72ae David Howells 2021-10-21  449  	 * allocated.
54975963cf72ae David Howells 2021-10-21  450  	 */
54975963cf72ae David Howells 2021-10-21  451  	if (no_space_allocated_yet)
54975963cf72ae David Howells 2021-10-21  452  		goto check_space;
54975963cf72ae David Howells 2021-10-21  453  =

54975963cf72ae David Howells 2021-10-21  454  	pos =3D cachefiles_inject_re=
ad_error();
54975963cf72ae David Howells 2021-10-21  455  	if (pos =3D=3D 0)
54975963cf72ae David Howells 2021-10-21  456  		pos =3D vfs_llseek(file, *_=
start, SEEK_DATA);
54975963cf72ae David Howells 2021-10-21  457  	if (pos < 0 && pos >=3D (lof=
f_t)-MAX_ERRNO) {
54975963cf72ae David Howells 2021-10-21  458  		if (pos =3D=3D -ENXIO)
54975963cf72ae David Howells 2021-10-21  459  			goto check_space; /* Unall=
ocated tail */
54975963cf72ae David Howells 2021-10-21  460  		trace_cachefiles_io_error(o=
bject, file_inode(file), pos,
54975963cf72ae David Howells 2021-10-21  461  					  cachefiles_trace_seek_=
error);
54975963cf72ae David Howells 2021-10-21  462  		return pos;
54975963cf72ae David Howells 2021-10-21  463  	}
54975963cf72ae David Howells 2021-10-21  464  	if ((u64)pos >=3D (u64)*_sta=
rt + *_len)
54975963cf72ae David Howells 2021-10-21  465  		goto check_space; /* Unallo=
cated region */
54975963cf72ae David Howells 2021-10-21  466  =

54975963cf72ae David Howells 2021-10-21  467  	/* We have a block that's at=
 least partially filled - if we're low on
54975963cf72ae David Howells 2021-10-21  468  	 * space, we need to see if =
it's fully allocated.  If it's not, we may
54975963cf72ae David Howells 2021-10-21  469  	 * want to cull it.
54975963cf72ae David Howells 2021-10-21  470  	 */
54975963cf72ae David Howells 2021-10-21  471  	if (cachefiles_has_space(cac=
he, 0, *_len / PAGE_SIZE) =3D=3D 0)
54975963cf72ae David Howells 2021-10-21  472  		return 0; /* Enough space t=
o simply overwrite the whole block */
54975963cf72ae David Howells 2021-10-21  473  =

54975963cf72ae David Howells 2021-10-21  474  	pos =3D cachefiles_inject_re=
ad_error();
54975963cf72ae David Howells 2021-10-21  475  	if (pos =3D=3D 0)
54975963cf72ae David Howells 2021-10-21  476  		pos =3D vfs_llseek(file, *_=
start, SEEK_HOLE);
54975963cf72ae David Howells 2021-10-21  477  	if (pos < 0 && pos >=3D (lof=
f_t)-MAX_ERRNO) {
54975963cf72ae David Howells 2021-10-21  478  		trace_cachefiles_io_error(o=
bject, file_inode(file), pos,
54975963cf72ae David Howells 2021-10-21  479  					  cachefiles_trace_seek_=
error);
54975963cf72ae David Howells 2021-10-21  480  		return pos;
54975963cf72ae David Howells 2021-10-21  481  	}
54975963cf72ae David Howells 2021-10-21  482  	if ((u64)pos >=3D (u64)*_sta=
rt + *_len)
54975963cf72ae David Howells 2021-10-21  483  		return 0; /* Fully allocate=
d */
54975963cf72ae David Howells 2021-10-21  484  =

54975963cf72ae David Howells 2021-10-21  485  	/* Partially allocated, but =
insufficient space: cull. */
54975963cf72ae David Howells 2021-10-21  486  	pos =3D cachefiles_inject_re=
move_error();
54975963cf72ae David Howells 2021-10-21  487  	if (pos =3D=3D 0)
54975963cf72ae David Howells 2021-10-21  488  		ret =3D vfs_fallocate(file,=
 FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
54975963cf72ae David Howells 2021-10-21  489  				    *_start, *_len);
54975963cf72ae David Howells 2021-10-21 @490  	if (ret < 0) {
54975963cf72ae David Howells 2021-10-21  491  		trace_cachefiles_io_error(o=
bject, file_inode(file), ret,
54975963cf72ae David Howells 2021-10-21  492  					  cachefiles_trace_fallo=
cate_error);
54975963cf72ae David Howells 2021-10-21  493  		cachefiles_io_error_obj(obj=
ect,
54975963cf72ae David Howells 2021-10-21  494  					"CacheFiles: fallocate f=
ailed (%d)\n", ret);
54975963cf72ae David Howells 2021-10-21  495  		ret =3D -EIO;
54975963cf72ae David Howells 2021-10-21  496  	}
54975963cf72ae David Howells 2021-10-21  497  =

54975963cf72ae David Howells 2021-10-21  498  	return ret;
54975963cf72ae David Howells 2021-10-21  499  =

54975963cf72ae David Howells 2021-10-21  500  check_space:
54975963cf72ae David Howells 2021-10-21  501  	return cachefiles_has_space(=
cache, 0, *_len / PAGE_SIZE);
54975963cf72ae David Howells 2021-10-21  502  }
54975963cf72ae David Howells 2021-10-21  503  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3824936961486251288==--

