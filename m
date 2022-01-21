Content-Type: multipart/mixed; boundary="===============3766142442659354613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c:224:8: warning: %llx in format string (no. 2) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
Date: Fri, 21 Jan 2022 22:26:06 +0800
Message-ID: <202201212254.uvRNzYbg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3766142442659354613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Graham Sider <Graham.Sider@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c2c94b3b187dc92b2002809f489e0f24a41e91bc
commit: 410e302ea53f095f5d94dc14efefe8191bde901b drm/amdkfd: Update SMI thr=
ottle event bitmask
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/rtc/rtc-rv8803.c:80:0: warning: syntax error [syntaxError]
   =

   ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_event=
s.c:
>> drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c:224:8: warning: %llx in form=
at string (no. 2) requires 'unsigned long long' but the argument type is 'u=
nsigned long'. [invalidPrintfArgType_uint]
    len =3D snprintf(fifo_in, sizeof(fifo_in), "%x %llx:%llxn",
          ^
--
>> drivers/net/wireless/intersil/hostap/hostap_ap.c:2078:12: warning: Varia=
ble 'left' is modified but its new value is never used. [unreadVariable]
      left -=3D ileft;
              ^
>> drivers/net/wireless/intersil/hostap/hostap_ap.c:3231:2: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
    *crypt =3D &sta->crypt;
    ^

vim +224 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c

55977744f9d862 Mukul Joshi  2020-08-28  206  =

2c2b0d880f1b4c Mukul Joshi  2020-07-23  207  void kfd_smi_event_update_ther=
mal_throttling(struct kfd_dev *dev,
410e302ea53f09 Graham Sider 2021-07-06  208  					     uint64_t throttle_bi=
tmask)
2c2b0d880f1b4c Mukul Joshi  2020-07-23  209  {
2c2b0d880f1b4c Mukul Joshi  2020-07-23  210  	struct amdgpu_device *adev =
=3D (struct amdgpu_device *)dev->kgd;
2c2b0d880f1b4c Mukul Joshi  2020-07-23  211  	/*
2c2b0d880f1b4c Mukul Joshi  2020-07-23  212  	 * ThermalThrottle msg =3D th=
rottle_bitmask(8):
2c2b0d880f1b4c Mukul Joshi  2020-07-23  213  	 * 			 thermal_interrupt_coun=
t(16):
410e302ea53f09 Graham Sider 2021-07-06  214  	 * 1 byte event + 1 byte spac=
e + 16 byte throttle_bitmask +
2c2b0d880f1b4c Mukul Joshi  2020-07-23  215  	 * 1 byte : + 16 byte thermal=
_interupt_counter + 1 byte \n +
410e302ea53f09 Graham Sider 2021-07-06  216  	 * 1 byte \0 =3D 37
2c2b0d880f1b4c Mukul Joshi  2020-07-23  217  	 */
410e302ea53f09 Graham Sider 2021-07-06  218  	char fifo_in[37];
2c2b0d880f1b4c Mukul Joshi  2020-07-23  219  	int len;
2c2b0d880f1b4c Mukul Joshi  2020-07-23  220  =

2c2b0d880f1b4c Mukul Joshi  2020-07-23  221  	if (list_empty(&dev->smi_clie=
nts))
2c2b0d880f1b4c Mukul Joshi  2020-07-23  222  		return;
2c2b0d880f1b4c Mukul Joshi  2020-07-23  223  =

410e302ea53f09 Graham Sider 2021-07-06 @224  	len =3D snprintf(fifo_in, siz=
eof(fifo_in), "%x %llx:%llx\n",
2c2b0d880f1b4c Mukul Joshi  2020-07-23  225  		       KFD_SMI_EVENT_THERMAL=
_THROTTLE, throttle_bitmask,
2c2b0d880f1b4c Mukul Joshi  2020-07-23  226  		       atomic64_read(&adev->=
smu.throttle_int_counter));
2c2b0d880f1b4c Mukul Joshi  2020-07-23  227  =

2c2b0d880f1b4c Mukul Joshi  2020-07-23  228  	add_event_to_kfifo(dev, KFD_S=
MI_EVENT_THERMAL_THROTTLE,	fifo_in, len);
2c2b0d880f1b4c Mukul Joshi  2020-07-23  229  }
2c2b0d880f1b4c Mukul Joshi  2020-07-23  230  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3766142442659354613==--

