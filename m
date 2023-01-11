Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F88B44D;
	Wed, 11 Jan 2023 04:22:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g10so10269201wmo.1;
        Tue, 10 Jan 2023 20:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftLAYv4HnjcIlKeQoEpxqzr+3v92yi3++RYeCqxlnJc=;
        b=ED1rkAEszLf1w0JP8ZRcNvQ/TdUg5LvnQmq/Oo5bFtBzx9Y0tJZGZL3bf1ww7A5u9X
         hKVqH/T8DHCiAUgRRzfjeRDH/ocsItkjK5UxqrABF7PVrJPVQqX4dqkyjsCjLvfc0ylt
         AW5+90nnswOuIAkMBByhJLMb1Ff1/HFTcnY2GboDrvojBOBeexuowo45ygszFJZnMoVy
         11i4MIr1U1wH4mycySUpKchb53Gaecro21axhjI+5EEqAw4HiGcd/PSyYLqnaL+vXedG
         PKFdt7LNVZl+dRQdzJ9Z9yfjG+JRy2nfY8Fpb2X6AJqu9NoTlzcXOJjrZiYwtBJ/Ogw8
         LrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftLAYv4HnjcIlKeQoEpxqzr+3v92yi3++RYeCqxlnJc=;
        b=JJ5eZNAa99cGRD/OG3CpSKen7KkUMsmLjnnj/8GbfoRa0iL4ls01BNy5IDLLFiuTXI
         MhTJ6HEi4D1gWQ7I3ySeISLKoDYm2ssXETf5CffuOQmY+0qWVWPk+q/chAkMslWoVrLx
         9LPh3yCnrh62gU7CmX3f0aERqi4WHQi8iasUW5QCfcELP7PLgQprXPhgovyW/bNqKq96
         quz5vyaA1RNQmB3Ye1r67hh90DaDN9JRetzq9n6i+vv3V47WIH7jWVursCg+0xFKd9rh
         G9gBuuyU2mmKQHrkmHOUtiDI9upcj9dGpj6KqqCkusam6w0I2SW997x1T4o89wiKWf6z
         Ha+g==
X-Gm-Message-State: AFqh2kpVmK9DEP+51eaAsE2Deo2C66w7VJdCrShft5KIwokpWEtYg/Cq
	cDj1/xCnvh0cpZN/92YeYnHmOQxzq6I=
X-Google-Smtp-Source: AMrXdXseySAzzfHhzIYdq8leghK75uUQJJOUq/9/uz9rpM1DqtYDQkEf5MTt+yD2JhiNTMJn8doiHw==
X-Received: by 2002:a05:600c:34cf:b0:3d0:7415:c5a9 with SMTP id d15-20020a05600c34cf00b003d07415c5a9mr52585728wmq.21.1673410960237;
        Tue, 10 Jan 2023 20:22:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c00d000b003cf4eac8e80sm20333621wmm.23.2023.01.10.20.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 20:22:39 -0800 (PST)
Date: Wed, 11 Jan 2023 07:22:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [tnguy-next-queue:dev-queue 50/62]
 drivers/net/ethernet/intel/ice/ice_lib.c:571 ice_vsi_alloc_stat_arrays()
 warn: possible memory leak of 'vsi_stat'
Message-ID: <202301110916.nD8vny59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230111042237.nPm8O-wFdo3cCTiInvaY8Ag4Keb6So5qFN6xzAiui5w@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   c9ebfbece30b59350bc6879be8ed954cecc6be05
commit: f833ce48581cfdf4b086d7c79cef79191b0a21d2 [50/62] ice: split ice_vsi_setup into smaller functions
config: x86_64-randconfig-m001-20230109
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/net/ethernet/intel/ice/ice_lib.c:571 ice_vsi_alloc_stat_arrays() warn: possible memory leak of 'vsi_stat'
drivers/net/ethernet/intel/ice/ice_lib.c:2846 ice_vsi_cfg_def() warn: missing error code 'ret'

Old smatch warnings:
drivers/net/ethernet/intel/ice/ice_lib.c:437 ice_vsi_alloc_ring_stats() warn: inconsistent indenting
drivers/net/ethernet/intel/ice/ice_lib.c:3527 ice_vsi_rebuild() warn: missing error code 'ret'

vim +/vsi_stat +571 drivers/net/ethernet/intel/ice/ice_lib.c

288ecf491b1654 Benjamin Mikailenko 2022-11-18  555  static int ice_vsi_alloc_stat_arrays(struct ice_vsi *vsi)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  556  {
288ecf491b1654 Benjamin Mikailenko 2022-11-18  557  	struct ice_vsi_stats *vsi_stat;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  558  	struct ice_pf *pf = vsi->back;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  559  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  560  	if (vsi->type == ICE_VSI_CHNL)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  561  		return 0;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  562  	if (!pf->vsi_stats)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  563  		return -ENOENT;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  564  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  565  	vsi_stat = kzalloc(sizeof(*vsi_stat), GFP_KERNEL);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  566  	if (!vsi_stat)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  567  		return -ENOMEM;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  568  
f833ce48581cfd Michal Swiatkowski  2022-12-21  569  	if (vsi_stat->tx_ring_stats && vsi_stat->rx_ring_stats)
f833ce48581cfd Michal Swiatkowski  2022-12-21  570  	/* realloc will happen in rebuild path */
f833ce48581cfd Michal Swiatkowski  2022-12-21 @571  		return 0;


These aren't allocated until the next line so the return is impossible.
Just delete.  But Smatch is correct that it doesn't have a kfree() on
this path...

f833ce48581cfd Michal Swiatkowski  2022-12-21  572  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  573  	vsi_stat->tx_ring_stats =
288ecf491b1654 Benjamin Mikailenko 2022-11-18  574  		kcalloc(vsi->alloc_txq, sizeof(*vsi_stat->tx_ring_stats),
288ecf491b1654 Benjamin Mikailenko 2022-11-18  575  			GFP_KERNEL);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  576  	if (!vsi_stat->tx_ring_stats)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  577  		goto err_alloc_tx;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  578  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  579  	vsi_stat->rx_ring_stats =
288ecf491b1654 Benjamin Mikailenko 2022-11-18  580  		kcalloc(vsi->alloc_rxq, sizeof(*vsi_stat->rx_ring_stats),
288ecf491b1654 Benjamin Mikailenko 2022-11-18  581  			GFP_KERNEL);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  582  	if (!vsi_stat->rx_ring_stats)
288ecf491b1654 Benjamin Mikailenko 2022-11-18  583  		goto err_alloc_rx;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  584  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  585  	pf->vsi_stats[vsi->idx] = vsi_stat;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  586  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  587  	return 0;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  588  
288ecf491b1654 Benjamin Mikailenko 2022-11-18  589  err_alloc_rx:
288ecf491b1654 Benjamin Mikailenko 2022-11-18  590  	kfree(vsi_stat->rx_ring_stats);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  591  err_alloc_tx:
288ecf491b1654 Benjamin Mikailenko 2022-11-18  592  	kfree(vsi_stat->tx_ring_stats);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  593  	kfree(vsi_stat);
288ecf491b1654 Benjamin Mikailenko 2022-11-18  594  	pf->vsi_stats[vsi->idx] = NULL;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  595  	return -ENOMEM;
288ecf491b1654 Benjamin Mikailenko 2022-11-18  596  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

