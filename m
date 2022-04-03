Content-Type: multipart/mixed; boundary="===============3530214378192601265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.17 8/787] drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: linux/pci.h is included more than once.
Date: Sun, 03 Apr 2022 23:48:47 +0800
Message-ID: <202204032339.FHdlNAtQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3530214378192601265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.17
head:   910f479048304416d2f70a98fb84a9466e56c169
commit: 0da7aeecd5b5d713567f2024fc69fa4711d3f8ce [8/787] drm/amdgpu: move P=
X checking into amdgpu_device_ip_early_init
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: linux/pci.h is included more=
 than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3530214378192601265==--

