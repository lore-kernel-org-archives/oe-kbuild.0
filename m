Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF9D281
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Oct 2023 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696318251; x=1727854251;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AfXsdfzT4H0M1OGODbsBkyNjujEOrYY5DPfvnfUWRgA=;
  b=hdYHMHS7dchO1fhPHJQPagBaFkIrEAaO1h4P7XrwKdK2ZZoWSfXDYlDt
   eCoQ0Wvs9FShzsB5rOGebVS4odRgpnHmEhSRd8s8fbKDpbS883WnNLAqr
   GuRECeqq/bhkCRq9vjAeK1khY4QM0ncQS7JqRD35j7rnqxQe4Q7NKMFbt
   pkfsJI2fmp5wevXq8cUH0jRCdYzuNpFWx9IfRL95QRz2mdw90wtO2wtJA
   xsIL9XWpe5SHUp3Dv90EEdpVgBzijOtbFCp2HTHsGeFq+eL4QJK/UFaj0
   VK4QknM0qYv3UMotq59bOpzlQ3tQFVGEz1wxJvHvY+nABYQT3FFZvmAAU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362183726"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362183726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 00:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866773956"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="866773956"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2023 00:30:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnZri-0006sX-0J;
	Tue, 03 Oct 2023 07:30:46 +0000
Date: Tue, 3 Oct 2023 15:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/hp/hp-wmi.c:953 hp_wmi_rfkill_setup() warn:
 'wifi_rfkill' is an error pointer or valid
Message-ID: <202310031554.GNYmRz3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jorge Lopez <jorge.lopez2@hp.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3
commit: 6e9b8992b122cb12688bd259fc99e67d1be234eb platform/x86: Move existing HP drivers to a new hp subdir
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20230925 (https://download.01.org/0day-ci/archive/20231003/202310031554.GNYmRz3K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310031554.GNYmRz3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310031554.GNYmRz3K-lkp@intel.com/

smatch warnings:
drivers/platform/x86/hp/hp-wmi.c:953 hp_wmi_rfkill_setup() warn: 'wifi_rfkill' is an error pointer or valid
drivers/platform/x86/hp/hp-wmi.c:969 hp_wmi_rfkill_setup() warn: 'bluetooth_rfkill' is an error pointer or valid
drivers/platform/x86/hp/hp-wmi.c:987 hp_wmi_rfkill_setup() warn: 'wwan_rfkill' is an error pointer or valid
drivers/platform/x86/hp/hp-wmi.c:1069 hp_wmi_rfkill2_setup() warn: 'rfkill' is an error pointer or valid

vim +/wifi_rfkill +953 drivers/platform/x86/hp/hp-wmi.c

62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   934  
702ef54255350c drivers/platform/x86/hp-wmi.c Mathias Krause       2014-07-16   935  static int __init hp_wmi_rfkill_setup(struct platform_device *device)
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   936  {
ea621d9fe372b4 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19   937) 	int err, wireless;
6d96e00cef3503 drivers/platform/x86/hp-wmi.c Thomas Renninger     2010-05-21   938  
ea621d9fe372b4 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19   939) 	wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19   940) 	if (wireless < 0)
ea621d9fe372b4 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19   941) 		return wireless;
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   942  
d8193cff33906e drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19   943) 	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE, &wireless,
fc8a601e1175ae drivers/platform/x86/hp-wmi.c Alex Hung            2016-06-13   944  				   sizeof(wireless), 0);
fc8a601e1175ae drivers/platform/x86/hp-wmi.c Alex Hung            2016-06-13   945  	if (err)
fc8a601e1175ae drivers/platform/x86/hp-wmi.c Alex Hung            2016-06-13   946  		return err;
fc8a601e1175ae drivers/platform/x86/hp-wmi.c Alex Hung            2016-06-13   947  
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   948  	if (wireless & 0x1) {
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   949  		wifi_rfkill = rfkill_alloc("hp-wifi", &device->dev,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   950  					   RFKILL_TYPE_WLAN,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   951  					   &hp_wmi_rfkill_ops,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   952  					   (void *) HPWMI_WIFI);
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17  @953  		if (!wifi_rfkill)
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17   954  			return -ENOMEM;
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   955  		rfkill_init_sw_state(wifi_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   956  				     hp_wmi_get_sw_state(HPWMI_WIFI));
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   957  		rfkill_set_hw_state(wifi_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   958  				    hp_wmi_get_hw_state(HPWMI_WIFI));
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   959  		err = rfkill_register(wifi_rfkill);
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   960  		if (err)
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   961  			goto register_wifi_error;
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   962  	}
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   963  
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   964  	if (wireless & 0x2) {
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   965  		bluetooth_rfkill = rfkill_alloc("hp-bluetooth", &device->dev,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   966  						RFKILL_TYPE_BLUETOOTH,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   967  						&hp_wmi_rfkill_ops,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   968  						(void *) HPWMI_BLUETOOTH);
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17  @969  		if (!bluetooth_rfkill) {
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17   970  			err = -ENOMEM;
c7805e5459f5ca drivers/platform/x86/hp-wmi.c Maciej S. Szmigiero  2016-03-06   971  			goto register_bluetooth_error;
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17   972  		}
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   973  		rfkill_init_sw_state(bluetooth_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   974  				     hp_wmi_get_sw_state(HPWMI_BLUETOOTH));
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   975  		rfkill_set_hw_state(bluetooth_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   976  				    hp_wmi_get_hw_state(HPWMI_BLUETOOTH));
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   977  		err = rfkill_register(bluetooth_rfkill);
6989d5651a16b4 drivers/platform/x86/hp-wmi.c Frans Pop            2009-01-29   978  		if (err)
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   979  			goto register_bluetooth_error;
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   980  	}
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   981  
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   982  	if (wireless & 0x4) {
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   983  		wwan_rfkill = rfkill_alloc("hp-wwan", &device->dev,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   984  					   RFKILL_TYPE_WWAN,
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02   985  					   &hp_wmi_rfkill_ops,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   986  					   (void *) HPWMI_WWAN);
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17  @987  		if (!wwan_rfkill) {
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17   988  			err = -ENOMEM;
c7805e5459f5ca drivers/platform/x86/hp-wmi.c Maciej S. Szmigiero  2016-03-06   989  			goto register_wwan_error;
dd258c00b96932 drivers/platform/x86/hp-wmi.c Dan Carpenter        2012-05-17   990  		}
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   991  		rfkill_init_sw_state(wwan_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   992  				     hp_wmi_get_sw_state(HPWMI_WWAN));
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   993  		rfkill_set_hw_state(wwan_rfkill,
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21   994  				    hp_wmi_get_hw_state(HPWMI_WWAN));
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   995  		err = rfkill_register(wwan_rfkill);
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09   996  		if (err)
5b5c2b3c9b0585 drivers/platform/x86/hp-wmi.c Kirill Tkhai         2013-07-29   997  			goto register_wwan_error;
3f6e2f137c5b83 drivers/misc/hp-wmi.c         Matthew Garrett      2008-09-02   998  	}
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25   999  
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  1000  	return 0;
fffcad87d4e7c5 drivers/platform/x86/hp-wmi.c Maciej S. Szmigiero  2016-03-06  1001  
5b5c2b3c9b0585 drivers/platform/x86/hp-wmi.c Kirill Tkhai         2013-07-29  1002  register_wwan_error:
5b5c2b3c9b0585 drivers/platform/x86/hp-wmi.c Kirill Tkhai         2013-07-29  1003  	rfkill_destroy(wwan_rfkill);
5b5c2b3c9b0585 drivers/platform/x86/hp-wmi.c Kirill Tkhai         2013-07-29  1004  	wwan_rfkill = NULL;
c7805e5459f5ca drivers/platform/x86/hp-wmi.c Maciej S. Szmigiero  2016-03-06  1005  	if (bluetooth_rfkill)
c7805e5459f5ca drivers/platform/x86/hp-wmi.c Maciej S. Szmigiero  2016-03-06  1006  		rfkill_unregister(bluetooth_rfkill);
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09  1007  register_bluetooth_error:
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  1008  	rfkill_destroy(bluetooth_rfkill);
6d97db590ca278 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1009  	bluetooth_rfkill = NULL;
44f0606d52d98f drivers/platform/x86/hp-wmi.c Andrew Morton        2009-02-04  1010  	if (wifi_rfkill)
fe8e4e039dc368 drivers/platform/x86/hp-wmi.c Larry Finger         2009-01-09  1011  		rfkill_unregister(wifi_rfkill);
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  1012  register_wifi_error:
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  1013  	rfkill_destroy(wifi_rfkill);
6d97db590ca278 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1014  	wifi_rfkill = NULL;
eceb7bdf644b41 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1015  	return err;
eceb7bdf644b41 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1016  }
eceb7bdf644b41 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1017  
702ef54255350c drivers/platform/x86/hp-wmi.c Mathias Krause       2014-07-16  1018  static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1019  {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1020  	struct bios_rfkill2_state state;
3bf9310a573d92 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-13  1021) 	int err, i;
3bf9310a573d92 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-13  1022) 
d8193cff33906e drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  1023) 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
65f936f3535950 drivers/platform/x86/hp-wmi.c Bedant Patnaik       2022-06-09  1024  				   zero_if_sup(state), sizeof(state));
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1025  	if (err)
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  1026) 		return err < 0 ? err : -EINVAL;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1027  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1028  	if (state.count > HPWMI_MAX_RFKILL2_DEVICES) {
b5a4223c1ce5ed drivers/platform/x86/hp-wmi.c Joe Perches          2011-03-29  1029  		pr_warn("unable to parse 0x1b query output\n");
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1030  		return -EINVAL;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1031  	}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1032  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1033  	for (i = 0; i < state.count; i++) {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1034  		struct rfkill *rfkill;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1035  		enum rfkill_type type;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1036  		char *name;
42d17fa7856030 drivers/platform/x86/hp-wmi.c Jorge Lopez          2022-04-04  1037  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1038  		switch (state.device[i].radio_type) {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1039  		case HPWMI_WIFI:
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1040  			type = RFKILL_TYPE_WLAN;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1041  			name = "hp-wifi";
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1042  			break;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1043  		case HPWMI_BLUETOOTH:
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1044  			type = RFKILL_TYPE_BLUETOOTH;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1045  			name = "hp-bluetooth";
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1046  			break;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1047  		case HPWMI_WWAN:
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1048  			type = RFKILL_TYPE_WWAN;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1049  			name = "hp-wwan";
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1050  			break;
4fca7ce39f5751 drivers/platform/x86/hp-wmi.c Trepák Vilmos        2012-10-11  1051  		case HPWMI_GPS:
4fca7ce39f5751 drivers/platform/x86/hp-wmi.c Trepák Vilmos        2012-10-11  1052  			type = RFKILL_TYPE_GPS;
4fca7ce39f5751 drivers/platform/x86/hp-wmi.c Trepák Vilmos        2012-10-11  1053  			name = "hp-gps";
4fca7ce39f5751 drivers/platform/x86/hp-wmi.c Trepák Vilmos        2012-10-11  1054  			break;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1055  		default:
b5a4223c1ce5ed drivers/platform/x86/hp-wmi.c Joe Perches          2011-03-29  1056  			pr_warn("unknown device type 0x%x\n",
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1057  				state.device[i].radio_type);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1058  			continue;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1059  		}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1060  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1061  		if (!state.device[i].vendor_id) {
b5a4223c1ce5ed drivers/platform/x86/hp-wmi.c Joe Perches          2011-03-29  1062  			pr_warn("zero device %d while %d reported\n",
b5a4223c1ce5ed drivers/platform/x86/hp-wmi.c Joe Perches          2011-03-29  1063  				i, state.count);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1064  			continue;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1065  		}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1066  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1067  		rfkill = rfkill_alloc(name, &device->dev, type,
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1068  				      &hp_wmi_rfkill2_ops, (void *)(long)i);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20 @1069  		if (!rfkill) {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1070  			err = -ENOMEM;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1071  			goto fail;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1072  		}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1073  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1074  		rfkill2[rfkill2_count].id = state.device[i].rfkill_id;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1075  		rfkill2[rfkill2_count].num = i;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1076  		rfkill2[rfkill2_count].rfkill = rfkill;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1077  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1078  		rfkill_init_sw_state(rfkill,
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1079  				     IS_SWBLOCKED(state.device[i].power));
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1080  		rfkill_set_hw_state(rfkill,
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1081  				    IS_HWBLOCKED(state.device[i].power));
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1082  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1083  		if (!(state.device[i].power & HPWMI_POWER_BIOS))
b5a4223c1ce5ed drivers/platform/x86/hp-wmi.c Joe Perches          2011-03-29  1084  			pr_info("device %s blocked by BIOS\n", name);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1085  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1086  		err = rfkill_register(rfkill);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1087  		if (err) {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1088  			rfkill_destroy(rfkill);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1089  			goto fail;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1090  		}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1091  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1092  		rfkill2_count++;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1093  	}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1094  
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1095  	return 0;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1096  fail:
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1097  	for (; rfkill2_count > 0; rfkill2_count--) {
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1098  		rfkill_unregister(rfkill2[rfkill2_count - 1].rfkill);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1099  		rfkill_destroy(rfkill2[rfkill2_count - 1].rfkill);
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1100  	}
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1101  	return err;
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1102  }
c0b9c649449801 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  1103  

:::::: The code at line 953 was first introduced by commit
:::::: dd258c00b96932ce2a81a9bb8bb8e6be997aa2cc hp-wmi: check for allocation failures

:::::: TO: Dan Carpenter <dan.carpenter@oracle.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
