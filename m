Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33E11188
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 10:01:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so15509715e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689328913; x=1691920913;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+3uUEddOK/ldRbK5e/+73aQGGld8Th8yV8lQbPuufk=;
        b=AxrjQN0sYBEu6v/+yYLInyxLeyqNipGsF4YNu9VieTe2LH8TUFglfnvORu4L7Y2kb4
         HBTbBT7s4kQ2H81koY2V5c6Z/Wjq5sAthvd/Y/8o9etuV5aJdrvfOCW/l6sAgLVSIDg7
         DQRIGqrrnDTa0nIuQkRij9iJ84lVrWJooj71Ks9cg5Ztaw50030SbU0YEWgRBWWfuLDi
         Ib1CuWfqZfUNAVQAYGsluQSJQeMPvRN5jA6kRZNPyif1LIhfXFar3gaxmWLEIYA7V7PM
         Gm6NhpRQPqRCezlPSBitkwBRL7w1Iix8tEjKvqC/+GIuQUWON7ho7LILBf/hOpqhSBM8
         965A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328913; x=1691920913;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+3uUEddOK/ldRbK5e/+73aQGGld8Th8yV8lQbPuufk=;
        b=RmvcLIcyl7xqziVDA272SbgOy3L/K4CUmWPK0nGpBJxJUv50sr5Ccgyz09uOeog5Rw
         2FvSGm4Y5vlnhR3MNl6XYKvghjZoBqKgxrnSk90QmavH7MQ1Ksvgn0aWnNjUBdZcsxuf
         GVANRhwcMiII+xLG6N2oNXRuwmutX0L8CvC6SZyvEj0a8Y5jxxoRPh6/R/BJ+yrbumYT
         tcaSA3GBvoVFrcoO9JBOtjKLco10hgAx4En40B8Ju3ThtHy8UjysRFtS5nsiYZtBesNP
         cCcn0SN99zPsQuc5Ql+rOFQAAyGMsM/suyab4VSmzs/yuOgMuKD+cqJt9BQAMecJAVWS
         FefQ==
X-Gm-Message-State: ABy/qLZXuZcaxMC1eRuJAI4v701XTNjHCDpBnsfcgkG1uT725pYEDYGm
	z8a+YLjFMcmZKCwhGUdM6xrjf+HJDGZ+ErVOxMc=
X-Google-Smtp-Source: APBJJlH0Xb55WT0nisYCKXvZjs3W2AvvHaCe8E5ujfB73YgIMqN0fmceFmp/Hy2vD64/Ab5hIMiUEQ==
X-Received: by 2002:a7b:cc81:0:b0:3fb:fca1:1965 with SMTP id p1-20020a7bcc81000000b003fbfca11965mr3293438wma.18.1689328913433;
        Fri, 14 Jul 2023 03:01:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bca47000000b003fbc30825fbsm1022796wml.39.2023.07.14.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:01:52 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:01:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 14/15]
 drivers/hwmon/nct6775-platform.c:1075 nct6775_find() error: buffer overflow
 'nct6775_sio_names' 13 <= 13
Message-ID: <8f49be45-5bad-4f48-ae7e-f75cde43c9d8@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   523a057d90b55d2cf1144ea6a4db90a9e9fc2e4b
commit: d9dc08ca8fa334c606d77c357b180e800cb75be1 [14/15] Use of_device_get_match_data
config: arm64-randconfig-m031-20230710 (https://download.01.org/0day-ci/archive/20230713/202307131212.gOOOZzf1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131212.gOOOZzf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307131212.gOOOZzf1-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct6775-platform.c:1075 nct6775_find() error: buffer overflow 'nct6775_sio_names' 13 <= 13
drivers/hwmon/nct6775-core.c:3858 nct6775_probe() error: testing array offset 'data->kind' after use.

vim +/nct6775_sio_names +1075 drivers/hwmon/nct6775-platform.c

c3963bc0a0cf9e Zev Weiss     2022-04-26   985  static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
c3963bc0a0cf9e Zev Weiss     2022-04-26   986  {
c3963bc0a0cf9e Zev Weiss     2022-04-26   987  	u16 val;
c3963bc0a0cf9e Zev Weiss     2022-04-26   988  	int err;
c3963bc0a0cf9e Zev Weiss     2022-04-26   989  	int addr;
c3963bc0a0cf9e Zev Weiss     2022-04-26   990  
c3963bc0a0cf9e Zev Weiss     2022-04-26   991  	sio_data->access = access_direct;
c3963bc0a0cf9e Zev Weiss     2022-04-26   992  	sio_data->sioreg = sioaddr;
c3963bc0a0cf9e Zev Weiss     2022-04-26   993  
c3963bc0a0cf9e Zev Weiss     2022-04-26   994  	err = sio_data->sio_enter(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26   995  	if (err)
c3963bc0a0cf9e Zev Weiss     2022-04-26   996  		return err;
c3963bc0a0cf9e Zev Weiss     2022-04-26   997  
c3963bc0a0cf9e Zev Weiss     2022-04-26   998  	val = (sio_data->sio_inb(sio_data, SIO_REG_DEVID) << 8) |
c3963bc0a0cf9e Zev Weiss     2022-04-26   999  		sio_data->sio_inb(sio_data, SIO_REG_DEVID + 1);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1000  	if (force_id && val != 0xffff)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1001  		val = force_id;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1002  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1003  	switch (val & SIO_ID_MASK) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1004  	case SIO_NCT6106_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1005  		sio_data->kind = nct6106;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1006  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1007  	case SIO_NCT6116_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1008  		sio_data->kind = nct6116;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1009  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1010  	case SIO_NCT6775_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1011  		sio_data->kind = nct6775;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1012  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1013  	case SIO_NCT6776_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1014  		sio_data->kind = nct6776;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1015  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1016  	case SIO_NCT6779_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1017  		sio_data->kind = nct6779;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1018  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1019  	case SIO_NCT6791_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1020  		sio_data->kind = nct6791;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1021  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1022  	case SIO_NCT6792_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1023  		sio_data->kind = nct6792;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1024  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1025  	case SIO_NCT6793_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1026  		sio_data->kind = nct6793;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1027  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1028  	case SIO_NCT6795_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1029  		sio_data->kind = nct6795;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1030  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1031  	case SIO_NCT6796_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1032  		sio_data->kind = nct6796;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1033  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1034  	case SIO_NCT6797_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1035  		sio_data->kind = nct6797;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1036  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1037  	case SIO_NCT6798_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1038  		sio_data->kind = nct6798;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1039  		break;
aee395bb190564 Guenter Roeck 2022-12-28  1040  	case SIO_NCT6799_ID:
aee395bb190564 Guenter Roeck 2022-12-28  1041  		sio_data->kind = nct6799;
aee395bb190564 Guenter Roeck 2022-12-28  1042  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1043  	default:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1044  		if (val != 0xffff)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1045  			pr_debug("unsupported chip ID: 0x%04x\n", val);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1046  		sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1047  		return -ENODEV;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1048  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1049  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1050  	/* We have a known chip, find the HWM I/O address */
c3963bc0a0cf9e Zev Weiss     2022-04-26  1051  	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1052  	val = (sio_data->sio_inb(sio_data, SIO_REG_ADDR) << 8)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1053  	    | sio_data->sio_inb(sio_data, SIO_REG_ADDR + 1);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1054  	addr = val & IOREGION_ALIGNMENT;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1055  	if (addr == 0) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1056  		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
c3963bc0a0cf9e Zev Weiss     2022-04-26  1057  		sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1058  		return -ENODEV;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1059  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1060  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1061  	/* Activate logical device if needed */
c3963bc0a0cf9e Zev Weiss     2022-04-26  1062  	val = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1063  	if (!(val & 0x01)) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1064  		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
c3963bc0a0cf9e Zev Weiss     2022-04-26  1065  		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1066  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1067  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1068  	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
c3963bc0a0cf9e Zev Weiss     2022-04-26  1069  	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
c3963bc0a0cf9e Zev Weiss     2022-04-26  1070  	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
aee395bb190564 Guenter Roeck 2022-12-28  1071  	    sio_data->kind == nct6798 || sio_data->kind == nct6799)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1072  		nct6791_enable_io_mapping(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1073  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1074  	sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26 @1075  	pr_info("Found %s or compatible chip at %#x:%#x\n",
c3963bc0a0cf9e Zev Weiss     2022-04-26  1076  		nct6775_sio_names[sio_data->kind], sioaddr, addr);
                                                        ^^^^^^^^^^^^^^^^^
You need to add another name to nct6775_sio_names[].

c3963bc0a0cf9e Zev Weiss     2022-04-26  1077  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1078  	return addr;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1079  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

