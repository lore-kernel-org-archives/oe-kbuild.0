Content-Type: multipart/mixed; boundary="===============7898098863128824442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:wip-fscrypt 11/55] fs/ceph/mds_client.c: crypto.h is included more than once.
Date: Mon, 04 Jul 2022 16:48:07 +0800
Message-ID: <202207041632.1P5mBRH5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7898098863128824442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: ceph-devel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Xiubo Li <xiubli@redhat.com>

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   478db929cbe5f548390db0e16307dd913d5b0462
commit: ca81875bfd02b0b49014eab59636aa114c2e8e31 [11/55] ceph: add encrypte=
d fname handling to ceph_mdsc_build_path
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/ceph/mds_client.c: crypto.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7898098863128824442==--

