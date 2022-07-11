Content-Type: multipart/mixed; boundary="===============6995647026474260219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-split 18/25] fs/btrfs/volumes.c:6717:5-24: atomic_dec_and_test variation before object free at line 6719.
Date: Mon, 11 Jul 2022 09:31:45 +0800
Message-ID: <202207110418.wS47eCzK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6995647026474260219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-split
head:   f0f456a7f6d7bdce3e9e996e8cc0da25ab8efc1d
commit: 468c0b648ae81c96bfd394b45d2fb827d35a3088 [18/25] btrfs: move checks=
um validation and repair to the storage layer
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
711/202207110418.wS47eCzK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/volumes.c:6717:5-24: atomic_dec_and_test variation before objec=
t free at line 6719.

vim +6717 fs/btrfs/volumes.c

468c0b648ae81c Christoph Hellwig 2022-07-02  6714  =

468c0b648ae81c Christoph Hellwig 2022-07-02  6715  static void btrfs_repair=
_done(struct btrfs_failed_bio *fbio)
468c0b648ae81c Christoph Hellwig 2022-07-02  6716  {
468c0b648ae81c Christoph Hellwig 2022-07-02 @6717  	if (atomic_dec_and_test=
(&fbio->repair_count)) {
468c0b648ae81c Christoph Hellwig 2022-07-02  6718  		fbio->bbio->end_io(fbi=
o->bbio);
468c0b648ae81c Christoph Hellwig 2022-07-02 @6719  		mempool_free(fbio, &bt=
rfs_failed_bio_pool);
468c0b648ae81c Christoph Hellwig 2022-07-02  6720  	}
468c0b648ae81c Christoph Hellwig 2022-07-02  6721  }
468c0b648ae81c Christoph Hellwig 2022-07-02  6722  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6995647026474260219==--

