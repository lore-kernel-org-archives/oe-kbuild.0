Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA263AB;
	Fri, 10 Feb 2023 17:03:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6747713wma.1;
        Fri, 10 Feb 2023 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+KBiCeA4ijDqg4y8k+f83SSa62KGYq+9g0YrKkkcq8=;
        b=LpNH7o41RAJuLXAWayxGPlsxc4O7csHvczoCokGOrTi5R+qDle8MTOqhwdAMYzDFN1
         OeNU1E3Iu6gd1HyHhspuwAsY3vFml9b92jP4U0Ju28ZtTM9wkae08jsXa/1aMkr+AOMN
         FJGSoNAfa7VGgDz7LEF2z99e0ZOwqpr/mthuJiEIqDzL0600siFm4c61CCQ3SVLzz8tM
         voQRpnS+3HvQjEYuttA4mhlql7fTJE1cHS+SfzMT2aaAua23KZeYF98jkEVOpr3rbTBs
         J8U7mLtx/WMq0aWwxmfgXNOsZiRWdM+SqYZosA3Zdcbrk+jmITDVq65muGFOdmLfKANF
         mL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+KBiCeA4ijDqg4y8k+f83SSa62KGYq+9g0YrKkkcq8=;
        b=GTasHuGYr6Z36mmzA6zt03XHRWtclseiwoCSy8pw7V24hZ8Ys+is2qeOBRB7lcXmzd
         9VQE2QgpH6QAUjZBe1i30mIV7A54InRbegfbD5xXbNtBXg/jbe5Pnnws3tqygkAP6xC9
         9SThORjyk93PaayHLNtJytJNggtUIT8DhyYLWLI8/ixqTIqzQE6S/kc+MTtSdcwCmD83
         BTsCzetKIzSPMdf5I4jsCMm0b7GhncaDy3I5d5Kn0HCcS3j4mbh0X+22xiQkjMS+Dyd2
         29o6mp4wJngqtjuqUm9PK4i+0kP3x1NysllJhBm4Rsfxy93skHemJS7CRjTAe5rk9I26
         mPxw==
X-Gm-Message-State: AO0yUKU6FL3mGKllWf/xt8P74w+uxNghgp0SBpDwfK62tzQdcWhQnGlu
	NFnKzdYP8KNy6c5iv75qioQSNLeDBBg=
X-Google-Smtp-Source: AK7set/X1He524T0eVBlSO1czpvVh25K1x3bazfueVcqeqBonHHS+fFsHlmzDOEuXuINR0IsUHdJGA==
X-Received: by 2002:a05:600c:4b30:b0:3df:f3df:29b0 with SMTP id i48-20020a05600c4b3000b003dff3df29b0mr13178974wmp.14.1676048584200;
        Fri, 10 Feb 2023 09:03:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i20-20020a1c5414000000b003dc53217e07sm5852780wmb.16.2023.02.10.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:03:03 -0800 (PST)
Date: Fri, 10 Feb 2023 19:11:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ping-Ke Shih <pkshih@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/realtek/rtw89/mac.c:3829
 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'
Message-ID: <202302101023.ctlih5q0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230210161112.8zgwn-55CEBKMbqe7gUPidxDnFEG4XoqKJdzyDtYKzE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e544a07438522ab3688416e6e2e34bf0ee6d8755
commit: 7ba49f4c6896d83b3841c0b046a0a7b1e97cc0dd rtw89: 8852c: add 8852ce to Makefile and Kconfig
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101023.ctlih5q0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302101023.ctlih5q0-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw89/mac.c:3829 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'

vim +/ret +3829 drivers/net/wireless/realtek/rtw89/mac.c

e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3818  int rtw89_mac_cfg_ppdu_status(struct rtw89_dev *rtwdev, u8 mac_idx, bool enable)
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3819  {
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3820  	u32 reg = rtw89_mac_reg_by_idx(R_AX_PPDU_STAT, mac_idx);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3821  	int ret = 0;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3822  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3823  	ret = rtw89_mac_check_mac_en(rtwdev, mac_idx, RTW89_CMAC_SEL);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3824  	if (ret)
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3825  		return ret;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3826  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3827  	if (!enable) {
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3828  		rtw89_write32_clr(rtwdev, reg, B_AX_PPDU_STAT_RPT_EN);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11 @3829  		return ret;

The code is correct, but it would be more readable to return 0;

e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3830  	}
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3831  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3832  	rtw89_write32(rtwdev, reg, B_AX_PPDU_STAT_RPT_EN |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3833  				   B_AX_APP_MAC_INFO_RPT |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3834  				   B_AX_APP_RX_CNT_RPT | B_AX_APP_PLCP_HDR_RPT |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3835  				   B_AX_PPDU_STAT_RPT_CRC32);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3836  	rtw89_write32_mask(rtwdev, R_AX_HW_RPT_FWD, B_AX_FWD_PPDU_STAT_MASK,
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3837  			   RTW89_PRPT_DEST_HOST);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3838  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3839  	return ret;

Same here.

e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3840  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

