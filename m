Content-Type: multipart/mixed; boundary="===============8340730269178705818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bluetooth/hci_h5.c:1087:2: warning: There is an unknown macro here somewhere. Configuration is required. If SET_SYSTEM_SLEEP_PM_OPS is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 14:21:48 +0800
Message-ID: <202204051401.OCf6h8ML-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8340730269178705818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Archie Pusaka <apusaka@chromium.org>
CC: Marcel Holtmann <marcel@holtmann.org>
CC: "Abhishek Pandit-Subedi" <abhishekpandit@chromium.org>
CC: Hilda Wu <hildawu@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: d9dd833cf6d29695682ec7e7924c0d0992b906bc Bluetooth: hci_h5: Add run=
time suspend
date:   9 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 9 months ago
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bluetooth/hci_h5.c:1087:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If SET_SYSTEM_SLEEP_PM_OPS is a ma=
cro then please configure it. [unknownMacro]
    SET_SYSTEM_SLEEP_PM_OPS(h5_serdev_suspend, h5_serdev_resume)
    ^

vim +1087 drivers/bluetooth/hci_h5.c

b825d7c4052643 Jeremy Cline  2018-08-02  1085  =

28a75e4c813c7a Hans de Goede 2018-10-30  1086  static const struct dev_pm_o=
ps h5_serdev_pm_ops =3D {
28a75e4c813c7a Hans de Goede 2018-10-30 @1087  	SET_SYSTEM_SLEEP_PM_OPS(h5_=
serdev_suspend, h5_serdev_resume)
d9dd833cf6d296 Archie Pusaka 2021-07-23  1088  	SET_RUNTIME_PM_OPS(h5_serde=
v_suspend, h5_serdev_resume, NULL)
28a75e4c813c7a Hans de Goede 2018-10-30  1089  };
28a75e4c813c7a Hans de Goede 2018-10-30  1090  =


:::::: The code at line 1087 was first introduced by commit
:::::: 28a75e4c813c7ae7de5b4baf4c29369769247cc6 Bluetooth: hci_h5: Add susp=
end / resume ops

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8340730269178705818==--

