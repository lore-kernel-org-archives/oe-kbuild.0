Content-Type: multipart/mixed; boundary="===============0138784921408412126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/7] nilfs2: Convert nilfs_find_uncommited_extent() to use filemap_get_folios_contig()
Date: Tue, 16 Aug 2022 11:49:09 +0800
Message-ID: <202208161124.6bsJaKsJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0138784921408412126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/nilfs2=
/page.c:542:1: sparse: sparse: unused label 'out'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220815185452.37447-6-vishal.moola@gmail.com>
References: <20220815185452.37447-6-vishal.moola@gmail.com>
TO: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
TO: linux-fsdevel(a)vger.kernel.org
CC: linux-btrfs(a)vger.kernel.org
CC: linux-nilfs(a)vger.kernel.org
CC: linux-mm(a)kvack.org
CC: linux-kernel(a)vger.kernel.org
CC: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>

Hi "Vishal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220815]
[cannot apply to kdave/for-next konis-nilfs2/upstream]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/=
Convert-to-filemap_get_folios_contig/20220816-025830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-s001-20220815 (https://download.01.org/0day-ci/arch=
ive/20220816/202208161124.6bsJaKsJ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/ce1966344933bbe1001=
0035cd25f23ec7dd76914
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/Convert-to-fil=
emap_get_folios_contig/20220816-025830
        git checkout ce1966344933bbe10010035cd25f23ec7dd76914
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash fs/nilfs2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/nilfs2/page.c:542:1: sparse: sparse: unused label 'out'

vim +/out +542 fs/nilfs2/page.c

622daaff0a8975 Ryusuke Konishi       2010-12-26  466  =

622daaff0a8975 Ryusuke Konishi       2010-12-26  467  /**
622daaff0a8975 Ryusuke Konishi       2010-12-26  468   * nilfs_find_uncommi=
tted_extent - find extent of uncommitted data
622daaff0a8975 Ryusuke Konishi       2010-12-26  469   * @inode: inode
622daaff0a8975 Ryusuke Konishi       2010-12-26  470   * @start_blk: start =
block offset (in)
622daaff0a8975 Ryusuke Konishi       2010-12-26  471   * @blkoff: start off=
set of the found extent (out)
622daaff0a8975 Ryusuke Konishi       2010-12-26  472   *
622daaff0a8975 Ryusuke Konishi       2010-12-26  473   * This function sear=
ches an extent of buffers marked "delayed" which
622daaff0a8975 Ryusuke Konishi       2010-12-26  474   * starts from a bloc=
k offset equal to or larger than @start_blk.  If
622daaff0a8975 Ryusuke Konishi       2010-12-26  475   * such an extent was=
 found, this will store the start offset in
622daaff0a8975 Ryusuke Konishi       2010-12-26  476   * @blkoff and return=
 its length in blocks.  Otherwise, zero is
622daaff0a8975 Ryusuke Konishi       2010-12-26  477   * returned.
622daaff0a8975 Ryusuke Konishi       2010-12-26  478   */
622daaff0a8975 Ryusuke Konishi       2010-12-26  479  unsigned long nilfs_f=
ind_uncommitted_extent(struct inode *inode,
622daaff0a8975 Ryusuke Konishi       2010-12-26  480  					    sector_t sta=
rt_blk,
622daaff0a8975 Ryusuke Konishi       2010-12-26  481  					    sector_t *bl=
koff)
622daaff0a8975 Ryusuke Konishi       2010-12-26  482  {
ce1966344933bb Vishal Moola (Oracle  2022-08-15  483) 	unsigned int i, nr;
622daaff0a8975 Ryusuke Konishi       2010-12-26  484  	pgoff_t index;
622daaff0a8975 Ryusuke Konishi       2010-12-26  485  	unsigned int nblocks=
_in_page;
622daaff0a8975 Ryusuke Konishi       2010-12-26  486  	unsigned long length=
 =3D 0;
622daaff0a8975 Ryusuke Konishi       2010-12-26  487  	sector_t b;
ce1966344933bb Vishal Moola (Oracle  2022-08-15  488) 	struct folio_batch f=
batch;
ce1966344933bb Vishal Moola (Oracle  2022-08-15  489) 	struct folio *folio;
622daaff0a8975 Ryusuke Konishi       2010-12-26  490  =

622daaff0a8975 Ryusuke Konishi       2010-12-26  491  	if (inode->i_mapping=
->nrpages =3D=3D 0)
622daaff0a8975 Ryusuke Konishi       2010-12-26  492  		return 0;
622daaff0a8975 Ryusuke Konishi       2010-12-26  493  =

09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  494  	index =3D start_blk =
>> (PAGE_SHIFT - inode->i_blkbits);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  495  	nblocks_in_page =3D =
1U << (PAGE_SHIFT - inode->i_blkbits);
622daaff0a8975 Ryusuke Konishi       2010-12-26  496  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  497) 	folio_batch_init(&fb=
atch);
622daaff0a8975 Ryusuke Konishi       2010-12-26  498  =

622daaff0a8975 Ryusuke Konishi       2010-12-26  499  repeat:
ce1966344933bb Vishal Moola (Oracle  2022-08-15  500) 	nr =3D filemap_get_f=
olios_contig(inode->i_mapping, &index, ULONG_MAX,
ce1966344933bb Vishal Moola (Oracle  2022-08-15  501) 			&fbatch);
ce1966344933bb Vishal Moola (Oracle  2022-08-15  502) 	if (nr =3D=3D 0)
622daaff0a8975 Ryusuke Konishi       2010-12-26  503  		return length;
622daaff0a8975 Ryusuke Konishi       2010-12-26  504  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  505) 	b =3D fbatch.folios[=
0]->index << (PAGE_SHIFT - inode->i_blkbits);
622daaff0a8975 Ryusuke Konishi       2010-12-26  506  	i =3D 0;
622daaff0a8975 Ryusuke Konishi       2010-12-26  507  	do {
ce1966344933bb Vishal Moola (Oracle  2022-08-15  508) 		folio =3D fbatch.fo=
lios[i];
622daaff0a8975 Ryusuke Konishi       2010-12-26  509  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  510) 		folio_lock(folio);
ce1966344933bb Vishal Moola (Oracle  2022-08-15  511) 		if (folio_buffers(f=
olio)) {
622daaff0a8975 Ryusuke Konishi       2010-12-26  512  			struct buffer_head=
 *bh, *head;
622daaff0a8975 Ryusuke Konishi       2010-12-26  513  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  514) 			bh =3D head =3D fo=
lio_buffers(folio);
622daaff0a8975 Ryusuke Konishi       2010-12-26  515  			do {
622daaff0a8975 Ryusuke Konishi       2010-12-26  516  				if (b < start_blk)
622daaff0a8975 Ryusuke Konishi       2010-12-26  517  					continue;
622daaff0a8975 Ryusuke Konishi       2010-12-26  518  				if (buffer_delay(=
bh)) {
622daaff0a8975 Ryusuke Konishi       2010-12-26  519  					if (length =3D=
=3D 0)
622daaff0a8975 Ryusuke Konishi       2010-12-26  520  						*blkoff =3D b;
622daaff0a8975 Ryusuke Konishi       2010-12-26  521  					length++;
622daaff0a8975 Ryusuke Konishi       2010-12-26  522  				} else if (length=
 > 0) {
622daaff0a8975 Ryusuke Konishi       2010-12-26  523  					goto out_locked;
622daaff0a8975 Ryusuke Konishi       2010-12-26  524  				}
622daaff0a8975 Ryusuke Konishi       2010-12-26  525  			} while (++b, bh =
=3D bh->b_this_page, bh !=3D head);
622daaff0a8975 Ryusuke Konishi       2010-12-26  526  		} else {
622daaff0a8975 Ryusuke Konishi       2010-12-26  527  			if (length > 0)
622daaff0a8975 Ryusuke Konishi       2010-12-26  528  				goto out_locked;
622daaff0a8975 Ryusuke Konishi       2010-12-26  529  =

622daaff0a8975 Ryusuke Konishi       2010-12-26  530  			b +=3D nblocks_in_=
page;
622daaff0a8975 Ryusuke Konishi       2010-12-26  531  		}
ce1966344933bb Vishal Moola (Oracle  2022-08-15  532) 		folio_unlock(folio);
622daaff0a8975 Ryusuke Konishi       2010-12-26  533  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  534) 	} while (++i < nr);
622daaff0a8975 Ryusuke Konishi       2010-12-26  535  =

ce1966344933bb Vishal Moola (Oracle  2022-08-15  536) 	folio_batch_release(=
&fbatch);
622daaff0a8975 Ryusuke Konishi       2010-12-26  537  	cond_resched();
622daaff0a8975 Ryusuke Konishi       2010-12-26  538  	goto repeat;
622daaff0a8975 Ryusuke Konishi       2010-12-26  539  =

622daaff0a8975 Ryusuke Konishi       2010-12-26  540  out_locked:
ce1966344933bb Vishal Moola (Oracle  2022-08-15  541) 	folio_unlock(folio);
622daaff0a8975 Ryusuke Konishi       2010-12-26 @542  out:

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0138784921408412126==--

