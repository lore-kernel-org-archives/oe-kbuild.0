Content-Type: multipart/mixed; boundary="===============8381992935070016879=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 15/43] fs/xfs/xfs_attr_item.c:58:6-25: atomic_dec_and_test variation before object free at line 61.
Date: Sat, 07 May 2022 01:21:27 +0800
Message-ID: <202205070154.82I6MMYC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8381992935070016879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   d8fa98c66946d5b1e01531cf7cb50151817f6894
commit: fd920008784ead369e79c2be2f8d9cc736e306ca [15/43] xfs: Set up infras=
tructure for log attribute replay
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-c003-20220506 (https://download.01.org/0day-ci/a=
rchive/20220507/202205070154.82I6MMYC-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_attr_item.c:58:6-25: atomic_dec_and_test variation before obj=
ect free at line 61.

vim +58 fs/xfs/xfs_attr_item.c

fd920008784ead Allison Henderson 2022-05-04  45  =

fd920008784ead Allison Henderson 2022-05-04  46  /*
fd920008784ead Allison Henderson 2022-05-04  47   * Freeing the attrip requ=
ires that we remove it from the AIL if it has already
fd920008784ead Allison Henderson 2022-05-04  48   * been placed there. Howe=
ver, the ATTRI may not yet have been placed in the
fd920008784ead Allison Henderson 2022-05-04  49   * AIL when called by xfs_=
attri_release() from ATTRD processing due to the
fd920008784ead Allison Henderson 2022-05-04  50   * ordering of committed v=
s unpin operations in bulk insert operations. Hence
fd920008784ead Allison Henderson 2022-05-04  51   * the reference count to =
ensure only the last caller frees the ATTRI.
fd920008784ead Allison Henderson 2022-05-04  52   */
fd920008784ead Allison Henderson 2022-05-04  53  STATIC void
fd920008784ead Allison Henderson 2022-05-04  54  xfs_attri_release(
fd920008784ead Allison Henderson 2022-05-04  55  	struct xfs_attri_log_item=
	*attrip)
fd920008784ead Allison Henderson 2022-05-04  56  {
fd920008784ead Allison Henderson 2022-05-04  57  	ASSERT(atomic_read(&attri=
p->attri_refcount) > 0);
fd920008784ead Allison Henderson 2022-05-04 @58  	if (!atomic_dec_and_test(=
&attrip->attri_refcount))
fd920008784ead Allison Henderson 2022-05-04  59  		return;
fd920008784ead Allison Henderson 2022-05-04  60  =

fd920008784ead Allison Henderson 2022-05-04 @61  	xfs_trans_ail_delete(&att=
rip->attri_item, 0);
fd920008784ead Allison Henderson 2022-05-04  62  	xfs_attri_item_free(attri=
p);
fd920008784ead Allison Henderson 2022-05-04  63  }
fd920008784ead Allison Henderson 2022-05-04  64  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8381992935070016879==--

