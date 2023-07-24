Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1641C03
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 08:12:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-316feb137a7so3605912f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186325; x=1690791125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4k5OhMJhQ2+wDaIsnK+q2wvHycQR/3aKhiixy4fXYjI=;
        b=Q4/qBPr2wh7Vf+6gHroZxcJ+7gzZx0/Av1wcmElSjFA4y0oi776ht2hQ6fCKBLZwZJ
         UiVJpifa1e/VhxyvH9hVomB/04uSpj1hHTd0EzE8/85CRJNycxJMRufM3Ugar5TTok39
         9UqtEOdI+jOm7Jt1lTnD06xSl8oPs+YwiVsGtxRGsLQqhZiZwefa1uvGZWyq5UxqWfNx
         Vr2xfFD+0O2+ZaQqA12VQ3NeeBpa3V/S+6IRN9YFqK+Hv5dru4jtwbr9u18vhMwX1atd
         AQJKGqDRTxgkpnrTo1qUULp6RAroNBVcJjMYBdb6g3H4mfAPLawwUMAF4/9YTAInGPdb
         GpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186325; x=1690791125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4k5OhMJhQ2+wDaIsnK+q2wvHycQR/3aKhiixy4fXYjI=;
        b=EyKDWTQUTrGl7Cry1g6sEuGvuRhk7+RAJDXWw/cLhx4fZ0LhWpqj96Eq1QZhczLVDR
         OAXQa/L9YxhKE7lFKRfnxUbo7+OnBowzGHxEASXfHGVivrUuD9cD3z3616DNST+fG4wh
         DZn+dQwmtaB11M9xCMlDaZ3qNqcYLUciCDeHOaDiJOeuQjNO/29thRRAyVBczhA4HG4H
         eTqlvtkKNYha/LxqvBQGKSxZpTGfPnylSu74krwRvHaFO21e0rgbm2viRXI8L0MBcdBn
         edGdh+La9SNLFp/dbLeevGncUKacVg9wkvlAcd5RRoZoEUFaaC7bS9CnsAVmkIrj1sWu
         gmJg==
X-Gm-Message-State: ABy/qLbKmvbbDd8BKp+jkbtEhi3b8xlJDcwT3jDv4O8oOmDo3Begd1k9
	0mGFvjCGVdPmSCMSfQzKtmBVJCi2qP2afzOmdMM=
X-Google-Smtp-Source: APBJJlGoMgHLJ1cKd5aJqaLTlO06gDBNrDyl//41YVyP447RVi+HA13AfLB5FkE7sUp3G1ToOQiivw==
X-Received: by 2002:adf:ec8e:0:b0:317:6513:da7c with SMTP id z14-20020adfec8e000000b003176513da7cmr119308wrn.18.1690186325043;
        Mon, 24 Jul 2023 01:12:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020adfce0f000000b00301a351a8d6sm12050255wrn.84.2023.07.24.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:12:04 -0700 (PDT)
Date: Mon, 24 Jul 2023 11:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Joel Granados <j.granados@samsung.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl_remove_empty_elem 61/65]
 net/ax25/sysctl_net_ax25.c:158 ax25_register_dev_sysctl() error: buffer
 overflow 'table' 13 <= 13
Message-ID: <06d26e2d-88ab-4b17-919a-893426577ac3@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem
head:   c09c3a77be9924c3bbab7b538a03ecd68734e799
commit: 857e2e5922b442beef8ba18fa9ff9cec659003a1 [61/65] ax.25: rm sentinel element from ctl_table array
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230722/202307221942.GeOTwYoS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221942.GeOTwYoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307221942.GeOTwYoS-lkp@intel.com/

smatch warnings:
net/ax25/sysctl_net_ax25.c:158 ax25_register_dev_sysctl() error: buffer overflow 'table' 13 <= 13

vim +/table +158 net/ax25/sysctl_net_ax25.c

0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  147  int ax25_register_dev_sysctl(ax25_dev *ax25_dev)
^1da177e4c3f415 Linus Torvalds    2005-04-16  148  {
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  149  	char path[sizeof("net/ax25/") + IFNAMSIZ];
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  150  	int k;
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  151  	struct ctl_table *table;
^1da177e4c3f415 Linus Torvalds    2005-04-16  152  
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  153  	table = kmemdup(ax25_param_table, sizeof(ax25_param_table), GFP_KERNEL);
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  154  	if (!table)
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  155  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  156  
^1da177e4c3f415 Linus Torvalds    2005-04-16  157  	for (k = 0; k < AX25_MAX_VALUES; k++)
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19 @158  		table[k].data = &ax25_dev->values[k];
                                                                ^^^^^^^^
I trust the checker that this is a buffer overflow.

^1da177e4c3f415 Linus Torvalds    2005-04-16  159  
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  160  	snprintf(path, sizeof(path), "net/ax25/%s", ax25_dev->dev->name);
4a00c5fa7a2b9ee Joel Granados     2023-06-27  161  	ax25_dev->sysheader = register_net_sysctl_sz(&init_net, path, table,
4a00c5fa7a2b9ee Joel Granados     2023-06-27  162  						  ARRAY_SIZE(ax25_param_table));
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  163  	if (!ax25_dev->sysheader) {
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  164  		kfree(table);
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  165  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  166  	}
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  167  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  168  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

