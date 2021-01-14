Content-Type: multipart/mixed; boundary="===============7399736924071867440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ext4: reset retry counter when ext4_alloc_file_blocks() makes progress
Date: Thu, 14 Jan 2021 12:49:58 +0800
Message-ID: <202101141228.MW4Hilhr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7399736924071867440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210113221403.18258-1-enwlinux@gmail.com>
References: <20210113221403.18258-1-enwlinux@gmail.com>
TO: Eric Whitney <enwlinux@gmail.com>
TO: linux-ext4(a)vger.kernel.org
CC: tytso(a)mit.edu
CC: Eric Whitney <enwlinux@gmail.com>

Hi Eric,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on v5.11-rc3 next-20210113]
[cannot apply to tytso-fscrypt/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eric-Whitney/ext4-reset-re=
try-counter-when-ext4_alloc_file_blocks-makes-progress/20210114-101236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: m68k-randconfig-m031-20210114 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/extents.c:4456 ext4_alloc_file_blocks() error: uninitialized symbol=
 'ret'.

Old smatch warnings:
fs/ext4/extents.c:2396 ext4_rereserve_cluster() warn: should '(1) << sbi->s=
_cluster_bits' be a 64 bit type?
fs/ext4/extents.c:5760 ext4_clu_mapped() warn: should 'lclu << sbi->s_clust=
er_bits' be a 64 bit type?
fs/ext4/extents.c:6009 ext4_ext_replay_set_iblocks() warn: should 'numblks =
<< (inode->i_sb->s_blocksize_bits - 9)' be a 64 bit type?

vim +/ret +4456 fs/ext4/extents.c

a86c61812637c7dd Alex Tomas         2006-10-11  4378  =

0e8b6879f3c23403 Lukas Czerner      2014-03-18  4379  static int ext4_alloc=
_file_blocks(struct file *file, ext4_lblk_t offset,
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4380  				  ext4_lblk_t len=
, loff_t new_size,
77a2e84d51729da7 Tahsin Erdogan     2017-08-05  4381  				  int flags)
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4382  {
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4383  	struct inode *inode =
=3D file_inode(file);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4384  	handle_t *handle;
fb3666c305fccbd1 Eric Whitney       2021-01-13  4385  	int ret, ret2 =3D 0,=
 ret3 =3D 0;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4386  	int retries =3D 0;
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4387  	int depth =3D 0;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4388  	struct ext4_map_bloc=
ks map;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4389  	unsigned int credits;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4390  	loff_t epos;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4391  =

c3fe493ccdb1f443 Fabian Frederick   2016-09-15  4392  	BUG_ON(!ext4_test_in=
ode_flag(inode, EXT4_INODE_EXTENTS));
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4393  	map.m_lblk =3D offse=
t;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4394  	map.m_len =3D len;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4395  	/*
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4396  	 * Don't normalize t=
he request if it can fit in one extent so
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4397  	 * that it doesn't g=
et unnecessarily split into multiple
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4398  	 * extents.
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4399  	 */
556615dcbf38b0a9 Lukas Czerner      2014-04-20  4400  	if (len <=3D EXT_UNW=
RITTEN_MAX_LEN)
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4401  		flags |=3D EXT4_GET=
_BLOCKS_NO_NORMALIZE;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4402  =

0e8b6879f3c23403 Lukas Czerner      2014-03-18  4403  	/*
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4404  	 * credits to insert=
 1 extent into extent tree
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4405  	 */
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4406  	credits =3D ext4_chu=
nk_trans_blocks(inode, len);
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4407  	depth =3D ext_depth(=
inode);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4408  =

0e8b6879f3c23403 Lukas Czerner      2014-03-18  4409  retry:
fb3666c305fccbd1 Eric Whitney       2021-01-13  4410  	while (len) {
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4411  		/*
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4412  		 * Recalculate cred=
its when extent tree depth changes.
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4413  		 */
011c88e36c26a085 Dan Carpenter      2016-12-03  4414  		if (depth !=3D ext_=
depth(inode)) {
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4415  			credits =3D ext4_c=
hunk_trans_blocks(inode, len);
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4416  			depth =3D ext_dept=
h(inode);
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4417  		}
4134f5c88dcd5b00 Lukas Czerner      2015-06-15  4418  =

0e8b6879f3c23403 Lukas Czerner      2014-03-18  4419  		handle =3D ext4_jou=
rnal_start(inode, EXT4_HT_MAP_BLOCKS,
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4420  					    credits);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4421  		if (IS_ERR(handle))=
 {
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4422  			ret =3D PTR_ERR(ha=
ndle);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4423  			break;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4424  		}
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4425  		ret =3D ext4_map_bl=
ocks(handle, inode, &map, flags);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4426  		if (ret <=3D 0) {
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4427  			ext4_debug("inode =
#%lu: block %u: len %u: "
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4428  				   "ext4_ext_map_=
blocks returned %d",
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4429  				   inode->i_ino, =
map.m_lblk,
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4430  				   map.m_len, ret=
);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4431  			ext4_mark_inode_di=
rty(handle, inode);
fb3666c305fccbd1 Eric Whitney       2021-01-13  4432  			ext4_journal_stop(=
handle);
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4433  			break;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4434  		}
fb3666c305fccbd1 Eric Whitney       2021-01-13  4435  		/*
fb3666c305fccbd1 Eric Whitney       2021-01-13  4436  		 * allow a full ret=
ry cycle for any remaining allocations
fb3666c305fccbd1 Eric Whitney       2021-01-13  4437  		 */
fb3666c305fccbd1 Eric Whitney       2021-01-13  4438  		retries =3D 0;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4439  		map.m_lblk +=3D ret;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4440  		map.m_len =3D len =
=3D len - ret;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4441  		epos =3D (loff_t)ma=
p.m_lblk << inode->i_blkbits;
eeca7ea1baa939c9 Deepa Dinamani     2016-11-14  4442  		inode->i_ctime =3D =
current_time(inode);
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4443  		if (new_size) {
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4444  			if (epos > new_siz=
e)
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4445  				epos =3D new_size;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4446  			if (ext4_update_in=
ode_size(inode, epos) & 0x1)
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4447  				inode->i_mtime =
=3D inode->i_ctime;
c174e6d6979a04b7 Dmitry Monakhov    2014-08-27  4448  		}
4209ae12b12265d4 Harshad Shirwadkar 2020-04-26  4449  		ret2 =3D ext4_mark_=
inode_dirty(handle, inode);
c894aa97577e47d3 Eryu Guan          2017-12-03  4450  		ext4_update_inode_f=
sync_trans(handle, inode, 1);
4209ae12b12265d4 Harshad Shirwadkar 2020-04-26  4451  		ret3 =3D ext4_journ=
al_stop(handle);
4209ae12b12265d4 Harshad Shirwadkar 2020-04-26  4452  		ret2 =3D ret3 ? ret=
3 : ret2;
4209ae12b12265d4 Harshad Shirwadkar 2020-04-26  4453  		if (unlikely(ret2))
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4454  			break;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4455  	}
fb3666c305fccbd1 Eric Whitney       2021-01-13 @4456  	if (ret =3D=3D -ENOS=
PC && ext4_should_retry_alloc(inode->i_sb, &retries))
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4457  		goto retry;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4458  =

0e8b6879f3c23403 Lukas Czerner      2014-03-18  4459  	return ret > 0 ? ret=
2 : ret;
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4460  }
0e8b6879f3c23403 Lukas Czerner      2014-03-18  4461  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7399736924071867440==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
X6ftuQ8jIAEA
--===============7399736924071867440==--

