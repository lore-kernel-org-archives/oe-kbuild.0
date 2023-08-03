Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB21EA72
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Aug 2023 12:21:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so1135757a12.0
        for <oe-kbuild@lists.linux.dev>; Thu, 03 Aug 2023 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691065260; x=1691670060;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmQ2BxlsmB7Qtd3nt7EKtDmDGfI6XLh/lQMuL64mWFU=;
        b=zFVE6o3Ok35akuD1/c8IOhghZEaiqDMj7Zv2ndQPkNn/qSDyIY4wW0LARR7PQcIQdd
         f0zwLyCDjQPe/WVaXCp5AkHw/ox5NPZ/WwUuc1h55KL1nWjl+iPshv4jTyTcyt+lAZvz
         5j66zhvtXQVLO2Z8GHK/qmTqoqn9Xha654vGV7sBl8Htyho6dfJDymLsfv7m8yo2bq50
         dWB4GgLhC03G7fpO2RzrcDJ5SdJFQZTEngj+MY+/302qo08EO54GJXHIuvrN/sPAtZ0R
         SBkZe8PRoxjwSYoD8KCpxEN2EyC2BZk3bzHP+WoIXJVxdPSh7W/ZAiRnsPS0QE09oUGl
         l05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691065260; x=1691670060;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmQ2BxlsmB7Qtd3nt7EKtDmDGfI6XLh/lQMuL64mWFU=;
        b=gGAeDVWyPO6JIH/pcDyRs1l6B9FMsdEL9pyl/dcmBmmFFWF1uaMdjF7Mvo9yBVHMCC
         TA7+ZL6cH2VDLsGNppwlNfYmVbR8J0CnmUQ4Ck4EKhkhFfvJ3WPnR8yLBaFCaLrJ5868
         MFH7rtcQWpzelk+fc01zTk0uWEvE0OvJigwqTI/DcmKTDXKidaWdF1WrDW6PNBPQ1gYZ
         NvTJqKyHRLrnXXQPK/mknYjSAJEPh6WrfVKx0RLUngMpb0BGNKvvr+oyyr3Tv7kfAlpe
         4UTp4COclrYPKHWrt5cPrSOpA0smpvN/8ZzYZIWtDOeKc7Gw5QDnhbaMDcq2oFIcq0CY
         8TGQ==
X-Gm-Message-State: ABy/qLY07JN2KL6PbvpbOHB2sZUc6CoLnRrdJ22lXhfZ2QPDcNI6VQTa
	Z33123THBishcI1D1MuY9+3Y5+JFLQeQ0LpkztQ=
X-Google-Smtp-Source: APBJJlHo7J+seTjhMsDZ133lQ1/1DZWLsyz5vYy/JFYEsSVCkOjiMvXnOaaxsYCNPCvXPZpmbsUaKQ==
X-Received: by 2002:aa7:c70c:0:b0:522:1d1d:1de8 with SMTP id i12-20020aa7c70c000000b005221d1d1de8mr6722844edq.2.1691065260250;
        Thu, 03 Aug 2023 05:21:00 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402044400b00521d2f7459fsm10175004edw.49.2023.08.03.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:20:59 -0700 (PDT)
Date: Thu, 3 Aug 2023 15:20:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: [linux-next:master 1937/6910] drivers/mtd/nand/raw/qcom_nandc.c:2941
 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
Message-ID: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 89550beb098e04b951df079483fb064eafc0e5fa [1937/6910] mtd: rawnand: qcom: Implement exec_op()
config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/

New smatch warnings:
drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && intended here instead of ||?

Old smatch warnings:
drivers/mtd/nand/raw/qcom_nandc.c:3076 qcom_read_status_exec() warn: inconsistent indenting

vim +/ret +2941 drivers/mtd/nand/raw/qcom_nandc.c

89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2909  static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2910  			       struct qcom_op *q_op)
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2911  {
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2912  	int ret;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2913  
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2914  	switch (cmd) {
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2915  	case NAND_CMD_RESET:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2916  		ret = OP_RESET_DEVICE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2917  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2918  	case NAND_CMD_READID:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2919  		ret = OP_FETCH_ID;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2920  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2921  	case NAND_CMD_PARAM:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2922  		if (nandc->props->qpic_v2)
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2923  			ret = OP_PAGE_READ_ONFI_READ;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2924  		else
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2925  			ret = OP_PAGE_READ;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2926  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2927  	case NAND_CMD_ERASE1:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2928  	case NAND_CMD_ERASE2:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2929  		ret = OP_BLOCK_ERASE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2930  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2931  	case NAND_CMD_STATUS:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2932  		ret = OP_CHECK_STATUS;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2933  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2934  	case NAND_CMD_PAGEPROG:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2935  		ret = OP_PROGRAM_PAGE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2936  		q_op->flag = OP_PROGRAM_PAGE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2937  		nandc->exec_opwrite = true;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2938  		break;

No default case.  I'm more concerned about the && vs || warning, but
the zero day bot doesn't include that code into the email.

89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2939  	}
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2940  
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10 @2941  	return ret;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2942  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

