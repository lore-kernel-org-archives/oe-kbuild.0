Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DBC747A;
	Thu, 16 Feb 2023 15:25:17 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id a10so4136979edu.9;
        Thu, 16 Feb 2023 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEO22o3Dk3ciBP71x7ytIezt+hbCG4mr+YfOrNFP2Hs=;
        b=U+M0xrZG2bfXeG+te4IpjxjdKuIaMep2D7somvf4BaXeeTjjqds2XMZKtR7Lp93CkT
         4i5DxGa/HlX0nMz5xQT8w9hB98E0nuWjJqd/wUa5N3Olc3tA+5OtqgqV9lrW3wGs9/dM
         7rSR7zrIPq4we7VMe+xnhXJ54iRkFAD/gN5bnQaBQhIQo2Ufmt9GQdJIjuHJphu71Krf
         al058WF95p/O4lrox164zFETYRT2DUn2rxXSKdIGISzdCIgI6LOhIR+HbFtlItYC9T70
         B31/8a+g7HUgWmfTQ3ohJQ5WifS+Yz36T/tlfwX/0qpLfa/W/U+qVYh5oeMl3HNhy1Tu
         tvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEO22o3Dk3ciBP71x7ytIezt+hbCG4mr+YfOrNFP2Hs=;
        b=pckvPKzf29J1dSe3TS8uiarLgPUqRgdynVKPt2dDJH4PsAs6JR36wchiyKtwJOGDLM
         Mz9mbQsbCuIad+Dww/Tzwo7huKsuKcM7p7u5sCRaSlMPXN+neE2AaXG4hiqP2WmfdOGH
         W7eqngcJ4rPrIo2P7vbEnI41aLIHB91eIHqRaTtp0RB3ZJ1cFmGUjptI5V148xKLjEcs
         RbMKE4+S2tygAGjezNXW1DPofcxuyHn+Vv0OLLRTBIT+n0P6Jn3j6f1gODaPAyo9zczk
         c5DwoYTGprM1SpYz+IIPUwGFrOI/mR9S9/jys1Ggi937pXStA2AegDlS32UHYa23dafh
         +r2Q==
X-Gm-Message-State: AO0yUKWcCYRIA+hiD05Zb8AYUu5R9NIYgySaFIPACUiwIHBxaPLGIawP
	4+WwJvUbffY06QaxdzxJ0/28NkUvhF5zBQ==
X-Google-Smtp-Source: AK7set/52yShH8MOm689Vr/6YGUw/4lAp43RPkIACpdl7xpfJiUSHl+Ky3BxJGSpRrqfxfc0HgFvug==
X-Received: by 2002:a17:906:55c6:b0:8af:40b0:3dd1 with SMTP id z6-20020a17090655c600b008af40b03dd1mr7043315ejp.27.1676561115815;
        Thu, 16 Feb 2023 07:25:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gh31-20020a1709073c1f00b008b1797b77b2sm233958ejc.221.2023.02.16.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 07:25:15 -0800 (PST)
Date: Thu, 16 Feb 2023 18:25:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12793/13217] fs/ntfs3/super.c:1351
 ntfs_fill_super() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202302162319.bDJOuyfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230216152511.rN5saq6wbi9XZGPtwHyiFZ_BjddaDgU7L6zucYR3S88@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: b268663f49c37ffeb3cf41a5716444295dc50c3a [12793/13217] fs/ntfs3: Print details about mount fails
config: loongarch-randconfig-m041-20230215 (https://download.01.org/0day-ci/archive/20230216/202302162319.bDJOuyfy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302162319.bDJOuyfy-lkp@intel.com/

smatch warnings:
fs/ntfs3/super.c:1351 ntfs_fill_super() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1351 fs/ntfs3/super.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1338  		err = ntfs_objid_init(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1339  		if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1340  			ntfs_warn(sb, "Failed to initialize $Extend/$ObjId.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1341  			goto load_root;
82cae269cfa953 Konstantin Komarov 2021-08-13  1342  		}
b268663f49c37f Konstantin Komarov 2023-02-15  1343  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1344  
82cae269cfa953 Konstantin Komarov 2021-08-13  1345  load_root:
e8b8e97f91b80f Kari Argillander   2021-08-03  1346  	/* Load root. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1347  	ref.low = cpu_to_le32(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1348  	ref.seq = cpu_to_le16(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1349  	inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
c1ca8ef0262b25 Edward Lo          2022-09-09  1350  	if (IS_ERR(inode) || !inode->i_op) {
b268663f49c37f Konstantin Komarov 2023-02-15 @1351  		err = PTR_ERR(inode);
                                                                      ^^^^^^^^^^^^^^
This doesn't work for the "!inode->i_op" situation.  Also should it
call iput() for that?

b268663f49c37f Konstantin Komarov 2023-02-15  1352  		ntfs_err(sb, "Failed to load root (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1353  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1354  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1355  
82cae269cfa953 Konstantin Komarov 2021-08-13  1356  	sb->s_root = d_make_root(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1357  	if (!sb->s_root) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1358  		err = -ENOMEM;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1359  		goto put_inode_out;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1360  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1361  
82cae269cfa953 Konstantin Komarov 2021-08-13  1362  	return 0;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1363  
9b75450d6c5801 Konstantin Komarov 2021-09-28  1364  put_inode_out:
82cae269cfa953 Konstantin Komarov 2021-08-13  1365  	iput(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1366  out:
9b75450d6c5801 Konstantin Komarov 2021-09-28  1367  	/*
9b75450d6c5801 Konstantin Komarov 2021-09-28  1368  	 * Free resources here.
9b75450d6c5801 Konstantin Komarov 2021-09-28  1369  	 * ntfs_fs_free will be called with fc->s_fs_info = NULL
9b75450d6c5801 Konstantin Komarov 2021-09-28  1370  	 */
51e76a232f8c03 Shigeru Yoshida    2022-08-23  1371  	put_mount_options(sbi->options);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1372  	put_ntfs(sbi);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1373  	sb->s_fs_info = NULL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1374  
82cae269cfa953 Konstantin Komarov 2021-08-13  1375  	return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1376  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

