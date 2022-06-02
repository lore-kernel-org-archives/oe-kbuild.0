Content-Type: multipart/mixed; boundary="===============4101877281195735096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 218/401] fs/xfs/scrub/attr_repair.c:788 xrep_xattr_recover() error: uninitialized symbol 'need_flush'.
Date: Fri, 03 Jun 2022 00:16:27 +0800
Message-ID: <202206030008.hkf1GREv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4101877281195735096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: 41dbe024adc45afc35713faabd5a55a682ba1b00 [218/401] xfs: repair exte=
nded attributes
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: microblaze-randconfig-m031-20220601 (https://download.01.org/0day-c=
i/archive/20220603/202206030008.hkf1GREv-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/scrub/attr_repair.c:788 xrep_xattr_recover() error: uninitialized sy=
mbol 'need_flush'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/need_flush +788 fs/xfs/scrub/attr_repair.c

41dbe024adc45a Darrick J. Wong 2022-01-06  734  =

41dbe024adc45a Darrick J. Wong 2022-01-06  735  /* Extract as many attribut=
e keys and values as we can. */
41dbe024adc45a Darrick J. Wong 2022-01-06  736  STATIC int
41dbe024adc45a Darrick J. Wong 2022-01-06  737  xrep_xattr_recover(
41dbe024adc45a Darrick J. Wong 2022-01-06  738  	struct xrep_xattr	*rx)
41dbe024adc45a Darrick J. Wong 2022-01-06  739  {
41dbe024adc45a Darrick J. Wong 2022-01-06  740  	struct xfs_bmbt_irec	got;
41dbe024adc45a Darrick J. Wong 2022-01-06  741  	struct xfs_scrub	*sc =3D r=
x->sc;
41dbe024adc45a Darrick J. Wong 2022-01-06  742  	struct xfs_da_geometry	*ge=
o =3D sc->mp->m_attr_geo;
41dbe024adc45a Darrick J. Wong 2022-01-06  743  	xfs_fileoff_t		offset;
41dbe024adc45a Darrick J. Wong 2022-01-06  744  	xfs_extlen_t		len;
41dbe024adc45a Darrick J. Wong 2022-01-06  745  	xfs_dablk_t		dabno;
41dbe024adc45a Darrick J. Wong 2022-01-06  746  	int			nmap;
41dbe024adc45a Darrick J. Wong 2022-01-06  747  	int			error;
41dbe024adc45a Darrick J. Wong 2022-01-06  748  =

41dbe024adc45a Darrick J. Wong 2022-01-06  749  	/*
41dbe024adc45a Darrick J. Wong 2022-01-06  750  	 * Iterate each xattr leaf=
 block in the attr fork to scan them for any
41dbe024adc45a Darrick J. Wong 2022-01-06  751  	 * attributes that we migh=
t salvage.
41dbe024adc45a Darrick J. Wong 2022-01-06  752  	 */
41dbe024adc45a Darrick J. Wong 2022-01-06  753  	for (offset =3D 0;
41dbe024adc45a Darrick J. Wong 2022-01-06  754  	     offset < XFS_MAX_FILE=
OFF;
41dbe024adc45a Darrick J. Wong 2022-01-06  755  	     offset =3D got.br_sta=
rtoff + got.br_blockcount) {
41dbe024adc45a Darrick J. Wong 2022-01-06  756  		nmap =3D 1;
41dbe024adc45a Darrick J. Wong 2022-01-06  757  		error =3D xfs_bmapi_read(=
sc->ip, offset, XFS_MAX_FILEOFF - offset,
41dbe024adc45a Darrick J. Wong 2022-01-06  758  				&got, &nmap, XFS_BMAPI_=
ATTRFORK);
41dbe024adc45a Darrick J. Wong 2022-01-06  759  		if (error)
41dbe024adc45a Darrick J. Wong 2022-01-06  760  			return error;
41dbe024adc45a Darrick J. Wong 2022-01-06  761  		if (nmap !=3D 1)
41dbe024adc45a Darrick J. Wong 2022-01-06  762  			return -EFSCORRUPTED;
41dbe024adc45a Darrick J. Wong 2022-01-06  763  		if (!xfs_bmap_is_written_=
extent(&got))
41dbe024adc45a Darrick J. Wong 2022-01-06  764  			continue;
41dbe024adc45a Darrick J. Wong 2022-01-06  765  =

41dbe024adc45a Darrick J. Wong 2022-01-06  766  		for (dabno =3D round_up(g=
ot.br_startoff, geo->fsbcount);
41dbe024adc45a Darrick J. Wong 2022-01-06  767  		     dabno < got.br_start=
off + got.br_blockcount;
41dbe024adc45a Darrick J. Wong 2022-01-06  768  		     dabno +=3D len) {
41dbe024adc45a Darrick J. Wong 2022-01-06  769  			xfs_fileoff_t	curr_offse=
t =3D dabno - got.br_startoff;
41dbe024adc45a Darrick J. Wong 2022-01-06  770  			xfs_extlen_t	maxlen;
41dbe024adc45a Darrick J. Wong 2022-01-06  771  			bool		need_flush;
41dbe024adc45a Darrick J. Wong 2022-01-06  772  =

41dbe024adc45a Darrick J. Wong 2022-01-06  773  			if (xchk_should_terminat=
e(rx->sc, &error))
41dbe024adc45a Darrick J. Wong 2022-01-06  774  				return error;
41dbe024adc45a Darrick J. Wong 2022-01-06  775  =

41dbe024adc45a Darrick J. Wong 2022-01-06  776  			maxlen =3D min_t(xfs_fil=
blks_t, INT_MAX,
41dbe024adc45a Darrick J. Wong 2022-01-06  777  					got.br_blockcount - cu=
rr_offset);
41dbe024adc45a Darrick J. Wong 2022-01-06  778  			error =3D xrep_xattr_rec=
over_block(rx, dabno,
41dbe024adc45a Darrick J. Wong 2022-01-06  779  					curr_offset + got.br_s=
tartblock,
41dbe024adc45a Darrick J. Wong 2022-01-06  780  					maxlen, &len);
41dbe024adc45a Darrick J. Wong 2022-01-06  781  			if (error)
41dbe024adc45a Darrick J. Wong 2022-01-06  782  				return error;
41dbe024adc45a Darrick J. Wong 2022-01-06  783  =

41dbe024adc45a Darrick J. Wong 2022-01-06  784  			error =3D xrep_xattr_nee=
d_flush(rx, &need_flush);
41dbe024adc45a Darrick J. Wong 2022-01-06  785  			if (error)
41dbe024adc45a Darrick J. Wong 2022-01-06  786  				return error;
41dbe024adc45a Darrick J. Wong 2022-01-06  787  =

41dbe024adc45a Darrick J. Wong 2022-01-06 @788  			if (need_flush) {
41dbe024adc45a Darrick J. Wong 2022-01-06  789  				error =3D xrep_xattr_fl=
ush_salvaged(rx);
41dbe024adc45a Darrick J. Wong 2022-01-06  790  				if (error)
41dbe024adc45a Darrick J. Wong 2022-01-06  791  					return error;
41dbe024adc45a Darrick J. Wong 2022-01-06  792  			}
41dbe024adc45a Darrick J. Wong 2022-01-06  793  		}
41dbe024adc45a Darrick J. Wong 2022-01-06  794  	}
41dbe024adc45a Darrick J. Wong 2022-01-06  795  =

41dbe024adc45a Darrick J. Wong 2022-01-06  796  	return 0;
41dbe024adc45a Darrick J. Wong 2022-01-06  797  }
41dbe024adc45a Darrick J. Wong 2022-01-06  798  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4101877281195735096==--

