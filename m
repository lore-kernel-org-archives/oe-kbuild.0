Content-Type: multipart/mixed; boundary="===============0928717413362576052=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 45/86] fs/xfs/xfs_attr_item.c:58:5-24: atomic_dec_and_test variation before object free at line 59.
Date: Mon, 11 Apr 2022 16:51:29 +0800
Message-ID: <202204111602.dilcA9M2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0928717413362576052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   94f0889f7a0ffa0376c59381537cb14fdd0cc3c5
commit: 4ed55211bf917191d2aa857eef4f8b1062b15243 [45/86] xfs: Set up infras=
tructure for log attribute replay
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
411/202204111602.dilcA9M2-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_attr_item.c:58:5-24: atomic_dec_and_test variation before obj=
ect free at line 59.

vim +58 fs/xfs/xfs_attr_item.c

4ed55211bf9171 Allison Henderson 2022-04-11  45  =

4ed55211bf9171 Allison Henderson 2022-04-11  46  /*
4ed55211bf9171 Allison Henderson 2022-04-11  47   * Freeing the attrip requ=
ires that we remove it from the AIL if it has already
4ed55211bf9171 Allison Henderson 2022-04-11  48   * been placed there. Howe=
ver, the ATTRI may not yet have been placed in the
4ed55211bf9171 Allison Henderson 2022-04-11  49   * AIL when called by xfs_=
attri_release() from ATTRD processing due to the
4ed55211bf9171 Allison Henderson 2022-04-11  50   * ordering of committed v=
s unpin operations in bulk insert operations. Hence
4ed55211bf9171 Allison Henderson 2022-04-11  51   * the reference count to =
ensure only the last caller frees the ATTRI.
4ed55211bf9171 Allison Henderson 2022-04-11  52   */
4ed55211bf9171 Allison Henderson 2022-04-11  53  STATIC void
4ed55211bf9171 Allison Henderson 2022-04-11  54  xfs_attri_release(
4ed55211bf9171 Allison Henderson 2022-04-11  55  	struct xfs_attri_log_item=
	*attrip)
4ed55211bf9171 Allison Henderson 2022-04-11  56  {
4ed55211bf9171 Allison Henderson 2022-04-11  57  	ASSERT(atomic_read(&attri=
p->attri_refcount) > 0);
4ed55211bf9171 Allison Henderson 2022-04-11 @58  	if (atomic_dec_and_test(&=
attrip->attri_refcount)) {
4ed55211bf9171 Allison Henderson 2022-04-11 @59  		xfs_trans_ail_delete(&at=
trip->attri_item,
4ed55211bf9171 Allison Henderson 2022-04-11  60  				     SHUTDOWN_LOG_IO_E=
RROR);
4ed55211bf9171 Allison Henderson 2022-04-11  61  		xfs_attri_item_free(attr=
ip);
4ed55211bf9171 Allison Henderson 2022-04-11  62  	}
4ed55211bf9171 Allison Henderson 2022-04-11  63  }
4ed55211bf9171 Allison Henderson 2022-04-11  64  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0928717413362576052==--

