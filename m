Content-Type: multipart/mixed; boundary="===============0755453872716148664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.17 23/787] drivers/bus/mhi/core/init.c:87:16: warning: Uninitialized variable: index [uninitvar]
Date: Sun, 03 Apr 2022 06:18:55 +0800
Message-ID: <202204030620.N5bZbI9W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0755453872716148664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.17
head:   910f479048304416d2f70a98fb84a9466e56c169
commit: b7a792309fd10eaabb0476bc2f1c632d8383c0b9 [23/787] bus: mhi: Fix pm_=
state conversion to string
:::::: branch date: 21 hours ago
:::::: commit date: 34 hours ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bus/mhi/core/init.c:87:16: warning: Uninitialized variable: inde=
x [uninitvar]
    if (!state || index >=3D ARRAY_SIZE(mhi_pm_state_str))
                  ^
   drivers/bus/mhi/core/init.c:84:6: note: Assuming condition is false
    if (state)
        ^
   drivers/bus/mhi/core/init.c:87:16: note: Uninitialized variable: index
    if (!state || index >=3D ARRAY_SIZE(mhi_pm_state_str))
                  ^

vim +87 drivers/bus/mhi/core/init.c

a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  79  =

b7a792309fd10e Paul Davey            2022-03-01  80  const char *to_mhi_pm_=
state_str(u32 state)
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  81  {
b7a792309fd10e Paul Davey            2022-03-01  82  	int index;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  83  =

b7a792309fd10e Paul Davey            2022-03-01  84  	if (state)
b7a792309fd10e Paul Davey            2022-03-01  85  		index =3D __fls(stat=
e);
b7a792309fd10e Paul Davey            2022-03-01  86  =

b7a792309fd10e Paul Davey            2022-03-01 @87  	if (!state || index >=
=3D ARRAY_SIZE(mhi_pm_state_str))
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  88  		return "Invalid Stat=
e";
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  89  =

a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  90  	return mhi_pm_state_s=
tr[index];
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  91  }
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  92  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0755453872716148664==--

