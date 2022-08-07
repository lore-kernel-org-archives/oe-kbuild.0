Content-Type: multipart/mixed; boundary="===============0592089341143399568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 202/411] fs/remap_range.c:571:17: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 00:00:38 +0800
Message-ID: <202208072326.y46DqvlU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0592089341143399568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/remap_=
range.c:571:17: warning: use of uninitialized value '<unknown>' [CWE-457] [=
-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   1d79555b9e2bc74efef217aee3f208794112be10
commit: 23eba991e1a20b4a71314c01541d2e30af80a809 [202/411] vfs: introduce n=
ew file range exchange ioctl
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208072326.y46DqvlU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D23eba991e1a20b4a71314c01541d2e30af80a809
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 23eba991e1a20b4a71314c01541d2e30af80a809
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/remap_range.c: In function 'generic_xchg_file_range_checks':
>> fs/remap_range.c:571:17: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     571 |         int64_t test_len;
         |                 ^~~~~~~~
     'generic_xchg_file_range_checks': event 1
       |
       |  571 |         int64_t test_len;
       |      |                 ^~~~~~~~
       |      |                 |
       |      |                 (1) use of uninitialized value '<unknown>' =
here
       |

vim +571 fs/remap_range.c

23eba991e1a20b Darrick J. Wong 2022-07-14  561  =

23eba991e1a20b Darrick J. Wong 2022-07-14  562  /* Performs necessary check=
s before doing a range exchange. */
23eba991e1a20b Darrick J. Wong 2022-07-14  563  static int generic_xchg_fil=
e_range_checks(struct file *file1,
23eba991e1a20b Darrick J. Wong 2022-07-14  564  					  struct file *file2,
23eba991e1a20b Darrick J. Wong 2022-07-14  565  					  struct file_xchg_ran=
ge *fxr,
23eba991e1a20b Darrick J. Wong 2022-07-14  566  					  unsigned int blocksi=
ze)
23eba991e1a20b Darrick J. Wong 2022-07-14  567  {
23eba991e1a20b Darrick J. Wong 2022-07-14  568  	struct inode *inode1 =3D f=
ile1->f_mapping->host;
23eba991e1a20b Darrick J. Wong 2022-07-14  569  	struct inode *inode2 =3D f=
ile2->f_mapping->host;
23eba991e1a20b Darrick J. Wong 2022-07-14  570  	uint64_t blkmask =3D block=
size - 1;
23eba991e1a20b Darrick J. Wong 2022-07-14 @571  	int64_t test_len;
23eba991e1a20b Darrick J. Wong 2022-07-14  572  	uint64_t blen;
23eba991e1a20b Darrick J. Wong 2022-07-14  573  	loff_t size1, size2;
23eba991e1a20b Darrick J. Wong 2022-07-14  574  	int ret;
23eba991e1a20b Darrick J. Wong 2022-07-14  575  =

23eba991e1a20b Darrick J. Wong 2022-07-14  576  	/* Don't touch certain kin=
ds of inodes */
23eba991e1a20b Darrick J. Wong 2022-07-14  577  	if (IS_IMMUTABLE(inode1) |=
| IS_IMMUTABLE(inode2))
23eba991e1a20b Darrick J. Wong 2022-07-14  578  		return -EPERM;
23eba991e1a20b Darrick J. Wong 2022-07-14  579  	if (IS_SWAPFILE(inode1) ||=
 IS_SWAPFILE(inode2))
23eba991e1a20b Darrick J. Wong 2022-07-14  580  		return -ETXTBSY;
23eba991e1a20b Darrick J. Wong 2022-07-14  581  =

23eba991e1a20b Darrick J. Wong 2022-07-14  582  	size1 =3D i_size_read(inod=
e1);
23eba991e1a20b Darrick J. Wong 2022-07-14  583  	size2 =3D i_size_read(inod=
e2);
23eba991e1a20b Darrick J. Wong 2022-07-14  584  =

23eba991e1a20b Darrick J. Wong 2022-07-14  585  	/* Ranges cannot start aft=
er EOF. */
23eba991e1a20b Darrick J. Wong 2022-07-14  586  	if (fxr->file1_offset > si=
ze1 || fxr->file2_offset > size2)
23eba991e1a20b Darrick J. Wong 2022-07-14  587  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  588  =

23eba991e1a20b Darrick J. Wong 2022-07-14  589  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  590  	 * If the caller asked for=
 full files, check that the offset/length
23eba991e1a20b Darrick J. Wong 2022-07-14  591  	 * values cover all of bot=
h files.
23eba991e1a20b Darrick J. Wong 2022-07-14  592  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  593  	if ((fxr->flags & FILE_XCH=
G_RANGE_FULL_FILES) &&
23eba991e1a20b Darrick J. Wong 2022-07-14  594  	    (fxr->file1_offset !=
=3D 0 || fxr->file2_offset !=3D 0 ||
23eba991e1a20b Darrick J. Wong 2022-07-14  595  	     fxr->length !=3D size=
1 || fxr->length !=3D size2))
23eba991e1a20b Darrick J. Wong 2022-07-14  596  		return -EDOM;
23eba991e1a20b Darrick J. Wong 2022-07-14  597  =

23eba991e1a20b Darrick J. Wong 2022-07-14  598  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  599  	 * If the caller said to e=
xchange to EOF, we set the length of the
23eba991e1a20b Darrick J. Wong 2022-07-14  600  	 * request large enough to=
 cover everything to the end of both files.
23eba991e1a20b Darrick J. Wong 2022-07-14  601  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  602  	if (fxr->flags & FILE_XCHG=
_RANGE_TO_EOF)
23eba991e1a20b Darrick J. Wong 2022-07-14  603  		fxr->length =3D max_t(int=
64_t, size1 - fxr->file1_offset,
23eba991e1a20b Darrick J. Wong 2022-07-14  604  					     size2 - fxr->file=
2_offset);
23eba991e1a20b Darrick J. Wong 2022-07-14  605  =

23eba991e1a20b Darrick J. Wong 2022-07-14  606  	/* The start of both range=
s must be aligned to an fs block. */
23eba991e1a20b Darrick J. Wong 2022-07-14  607  	if (!IS_ALIGNED(fxr->file1=
_offset, blocksize) ||
23eba991e1a20b Darrick J. Wong 2022-07-14  608  	    !IS_ALIGNED(fxr->file2=
_offset, blocksize))
23eba991e1a20b Darrick J. Wong 2022-07-14  609  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  610  =

23eba991e1a20b Darrick J. Wong 2022-07-14  611  	/* Ensure offsets don't wr=
ap. */
23eba991e1a20b Darrick J. Wong 2022-07-14  612  	if (fxr->file1_offset + fx=
r->length < fxr->file1_offset ||
23eba991e1a20b Darrick J. Wong 2022-07-14  613  	    fxr->file2_offset + fx=
r->length < fxr->file2_offset)
23eba991e1a20b Darrick J. Wong 2022-07-14  614  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  615  =

23eba991e1a20b Darrick J. Wong 2022-07-14  616  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  617  	 * We require both ranges =
to be within EOF, unless we're exchanging
23eba991e1a20b Darrick J. Wong 2022-07-14  618  	 * to EOF.  generic_xchg_r=
ange_prep already checked that both
23eba991e1a20b Darrick J. Wong 2022-07-14  619  	 * fxr->file1_offset and f=
xr->file2_offset are within EOF.
23eba991e1a20b Darrick J. Wong 2022-07-14  620  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  621  	if (!(fxr->flags & FILE_XC=
HG_RANGE_TO_EOF) &&
23eba991e1a20b Darrick J. Wong 2022-07-14  622  	    (fxr->file1_offset + f=
xr->length > size1 ||
23eba991e1a20b Darrick J. Wong 2022-07-14  623  	     fxr->file2_offset + f=
xr->length > size2))
23eba991e1a20b Darrick J. Wong 2022-07-14  624  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  625  =

23eba991e1a20b Darrick J. Wong 2022-07-14  626  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  627  	 * Make sure we don't hit =
any file size limits.  If we hit any size
23eba991e1a20b Darrick J. Wong 2022-07-14  628  	 * limits such that test_l=
ength was adjusted, we abort the whole
23eba991e1a20b Darrick J. Wong 2022-07-14  629  	 * operation.
23eba991e1a20b Darrick J. Wong 2022-07-14  630  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  631  	test_len =3D fxr->length;
23eba991e1a20b Darrick J. Wong 2022-07-14  632  	ret =3D generic_write_chec=
k_limits(file2, fxr->file2_offset, &test_len);
23eba991e1a20b Darrick J. Wong 2022-07-14  633  	if (ret)
23eba991e1a20b Darrick J. Wong 2022-07-14  634  		return ret;
23eba991e1a20b Darrick J. Wong 2022-07-14  635  	ret =3D generic_write_chec=
k_limits(file1, fxr->file1_offset, &test_len);
23eba991e1a20b Darrick J. Wong 2022-07-14  636  	if (ret)
23eba991e1a20b Darrick J. Wong 2022-07-14  637  		return ret;
23eba991e1a20b Darrick J. Wong 2022-07-14  638  	if (test_len !=3D fxr->len=
gth)
23eba991e1a20b Darrick J. Wong 2022-07-14  639  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  640  =

23eba991e1a20b Darrick J. Wong 2022-07-14  641  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  642  	 * If the user wanted us t=
o exchange up to the infile's EOF, round up
23eba991e1a20b Darrick J. Wong 2022-07-14  643  	 * to the next block bound=
ary for this check.  Do the same for the
23eba991e1a20b Darrick J. Wong 2022-07-14  644  	 * outfile.
23eba991e1a20b Darrick J. Wong 2022-07-14  645  	 *
23eba991e1a20b Darrick J. Wong 2022-07-14  646  	 * Otherwise, reject the r=
ange length if it's not block aligned.  We
23eba991e1a20b Darrick J. Wong 2022-07-14  647  	 * already confirmed the s=
tarting offsets' block alignment.
23eba991e1a20b Darrick J. Wong 2022-07-14  648  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  649  	if (fxr->file1_offset + fx=
r->length =3D=3D size1)
23eba991e1a20b Darrick J. Wong 2022-07-14  650  		blen =3D ALIGN(size1, blo=
cksize) - fxr->file1_offset;
23eba991e1a20b Darrick J. Wong 2022-07-14  651  	else if (fxr->file2_offset=
 + fxr->length =3D=3D size2)
23eba991e1a20b Darrick J. Wong 2022-07-14  652  		blen =3D ALIGN(size2, blo=
cksize) - fxr->file2_offset;
23eba991e1a20b Darrick J. Wong 2022-07-14  653  	else if (!IS_ALIGNED(fxr->=
length, blocksize))
23eba991e1a20b Darrick J. Wong 2022-07-14  654  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  655  	else
23eba991e1a20b Darrick J. Wong 2022-07-14  656  		blen =3D fxr->length;
23eba991e1a20b Darrick J. Wong 2022-07-14  657  =

23eba991e1a20b Darrick J. Wong 2022-07-14  658  	/* Don't allow overlapped =
exchanges within the same file. */
23eba991e1a20b Darrick J. Wong 2022-07-14  659  	if (inode1 =3D=3D inode2 &&
23eba991e1a20b Darrick J. Wong 2022-07-14  660  	    fxr->file2_offset + bl=
en > fxr->file1_offset &&
23eba991e1a20b Darrick J. Wong 2022-07-14  661  	    fxr->file1_offset + bl=
en > fxr->file2_offset)
23eba991e1a20b Darrick J. Wong 2022-07-14  662  		return -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  663  =

23eba991e1a20b Darrick J. Wong 2022-07-14  664  	/* If we already failed th=
e freshness check, we're done. */
23eba991e1a20b Darrick J. Wong 2022-07-14  665  	ret =3D generic_xchg_file_=
range_check_fresh(inode2, fxr);
23eba991e1a20b Darrick J. Wong 2022-07-14  666  	if (ret)
23eba991e1a20b Darrick J. Wong 2022-07-14  667  		return ret;
23eba991e1a20b Darrick J. Wong 2022-07-14  668  =

23eba991e1a20b Darrick J. Wong 2022-07-14  669  	/*
23eba991e1a20b Darrick J. Wong 2022-07-14  670  	 * Ensure that we don't ex=
change a partial EOF block into the middle of
23eba991e1a20b Darrick J. Wong 2022-07-14  671  	 * another file.
23eba991e1a20b Darrick J. Wong 2022-07-14  672  	 */
23eba991e1a20b Darrick J. Wong 2022-07-14  673  	if ((fxr->length & blkmask=
) =3D=3D 0)
23eba991e1a20b Darrick J. Wong 2022-07-14  674  		return 0;
23eba991e1a20b Darrick J. Wong 2022-07-14  675  =

23eba991e1a20b Darrick J. Wong 2022-07-14  676  	blen =3D fxr->length;
23eba991e1a20b Darrick J. Wong 2022-07-14  677  	if (fxr->file2_offset + bl=
en < size2)
23eba991e1a20b Darrick J. Wong 2022-07-14  678  		blen &=3D ~blkmask;
23eba991e1a20b Darrick J. Wong 2022-07-14  679  =

23eba991e1a20b Darrick J. Wong 2022-07-14  680  	if (fxr->file1_offset + bl=
en < size1)
23eba991e1a20b Darrick J. Wong 2022-07-14  681  		blen &=3D ~blkmask;
23eba991e1a20b Darrick J. Wong 2022-07-14  682  =

23eba991e1a20b Darrick J. Wong 2022-07-14  683  	return blen =3D=3D fxr->le=
ngth ? 0 : -EINVAL;
23eba991e1a20b Darrick J. Wong 2022-07-14  684  }
23eba991e1a20b Darrick J. Wong 2022-07-14  685  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0592089341143399568==--

