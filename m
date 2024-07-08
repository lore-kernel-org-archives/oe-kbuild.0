Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904B1E536
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453496; cv=none; b=KZtCqxOOTAg76bwRhh8H+IGzgThSSPhkY2EeflA8UD3JqVPOy7IMosOl+wxYWf0P710wnixWUf2p9nFG6oF7UFmUXN5WNTrveqftMZ4HKZAnSMyK8BVNa7mEYmnezeEMNYEdo1LUxmL8pR5b7C1mZzwt8MWfMKrK3HoepGmfrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453496; c=relaxed/simple;
	bh=OJe5lZmJr3fF2OsfUfCTsvxehv+Bw7Ry/VIAoY0f60k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdUvu6UBY2iVthp8ftlLE/HnrcZIFKhDMQ+gYOUm+JDIU1Wqw3DHa0tmnxf59/bY1JRbHs1eXf8ztf4scJvcc/FOuYKF2qY5HkAbTvKwMxBsIEgllQKI4CKa6v23j74SmLQmUnzUXpwDQzjQoiWXFVwJlX6W/o2jv9EyYqbKRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ/zScX8; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ/zScX8"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5c661519bc2so1413748eaf.2
        for <oe-kbuild@lists.linux.dev>; Mon, 08 Jul 2024 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720453493; x=1721058293; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwNSfE3htJIzmC6/CCUDkYytjUdGt1k8Nd1suzoQTKg=;
        b=ZQ/zScX8zFVDjTJFyzPEWGEszjgvnDYKc2pv7M3jtIZwyhyRq8OYnvonGcuocLGODm
         KCb2UxhQHoQH2arhtx6QiFvHOXlIjiMXTHoqRfT3RlIKHDfrw51WgE1PGjn7A7AjdkTN
         Ea/LDDKrTxCrf7BMkdxdzZCdedtT9srvYb8OBf4DEjsO1f/nT6WV1MdgUEc5OpPtfxyJ
         Algw5nZxWyfa5/hzQ8Zpse3pafPPogqPlsiwzz4PRj4h8U2H0QYGppdFyLQDY7gDsQka
         Tno/13fbauyPD+IsnmVBTf3tw1Eh/pnvsTd8K9O4LEZiog0Nym9Ptiux3WrQNKjT3egv
         lazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453493; x=1721058293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PwNSfE3htJIzmC6/CCUDkYytjUdGt1k8Nd1suzoQTKg=;
        b=fmoxIXqg8RyaAhiEOtzEcH3QqXme/ZyTp8xm0V21VGsyNhWUo6l1xmYpnH5pXxkLhG
         w5hM0Ai7Fabipdb4b3ofXhgktH1DpW880OWkqiJAAx7DKl5kAMng91w+zBY2CJXz00T1
         FiY8LSMNoGOv8JdNNytnMtvBRFtPd4XXvtQS+KwTSqN2JOm7zEjcZIv6M7DbIuEetis6
         7sGBAT10Xy83kUIuDmIXLygD48C4Qe75058ocbBmGol7Fe1ROkHl9nkewIU14leEXQ3P
         S9XG6z8wy9wdFYECrpZjXEgoAYd2zh/yI2ZlYahkCZBKlWLygFsIu86hfuXYqiB/mr2a
         XADg==
X-Gm-Message-State: AOJu0YxusExM2HxgV5fodBo0SZV0BJO/a2g2KPAtbCEIr4/+BjAOt1ll
	u/qyQC13WObLxVDNUWeS/LObV79U7LpgtZXoaO0iJV6kdmkSMKseU+yKCvSAc/x3Qxqzj1tr7NZ
	q
X-Google-Smtp-Source: AGHT+IE7nJP+NtLHrpFcQ2SszrSOQHs94OdysPr9VxCzpwzZvlkoGvdFNx2DKUNXfaOVsznZ4A+ZvQ==
X-Received: by 2002:a4a:de4f:0:b0:5c6:6029:b1cd with SMTP id 006d021491bc7-5c66029b48dmr7456031eaf.8.1720453493515;
        Mon, 08 Jul 2024 08:44:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6fc:b7f5:4853:aff3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c68cdfce18sm14132eaf.40.2024.07.08.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:44:53 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:44:52 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Junfeng Guo <junfeng.guo@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>
Subject: [tnguy-next-queue:dev-queue 12/92]
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c:875
 ice_vc_fdir_parse_raw() warn: missing error code 'status'
Message-ID: <51190ea3-51d2-4559-b382-0fa823d4cc86@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   d051d5283b530af3f9627c8e600aa581bc6c1958
commit: 23eb6f4d18624231cd3f57f322814591f38b3837 [12/92] ice: enable FDIR filters from raw binary patterns for VFs
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240707/202407070634.aTz9Naa1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407070634.aTz9Naa1-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c:875 ice_vc_fdir_parse_raw() warn: missing error code 'status'

vim +/status +875 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c

23eb6f4d186242 Junfeng Guo 2024-05-27  831  static int
23eb6f4d186242 Junfeng Guo 2024-05-27  832  ice_vc_fdir_parse_raw(struct ice_vf *vf,
23eb6f4d186242 Junfeng Guo 2024-05-27  833  		      struct virtchnl_proto_hdrs *proto,
23eb6f4d186242 Junfeng Guo 2024-05-27  834  		      struct virtchnl_fdir_fltr_conf *conf)
23eb6f4d186242 Junfeng Guo 2024-05-27  835  {
23eb6f4d186242 Junfeng Guo 2024-05-27  836  	u8 *pkt_buf, *msk_buf __free(kfree);
23eb6f4d186242 Junfeng Guo 2024-05-27  837  	struct ice_parser_result rslt;
23eb6f4d186242 Junfeng Guo 2024-05-27  838  	struct ice_pf *pf = vf->pf;
23eb6f4d186242 Junfeng Guo 2024-05-27  839  	struct ice_parser *psr;
23eb6f4d186242 Junfeng Guo 2024-05-27  840  	int status = -ENOMEM;
23eb6f4d186242 Junfeng Guo 2024-05-27  841  	struct ice_hw *hw;
23eb6f4d186242 Junfeng Guo 2024-05-27  842  	u16 udp_port = 0;
23eb6f4d186242 Junfeng Guo 2024-05-27  843  
23eb6f4d186242 Junfeng Guo 2024-05-27  844  	pkt_buf = kzalloc(proto->raw.pkt_len, GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  845  	msk_buf = kzalloc(proto->raw.pkt_len, GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  846  	if (!pkt_buf || !msk_buf)
23eb6f4d186242 Junfeng Guo 2024-05-27  847  		goto err_mem_alloc;
23eb6f4d186242 Junfeng Guo 2024-05-27  848  
23eb6f4d186242 Junfeng Guo 2024-05-27  849  	memcpy(pkt_buf, proto->raw.spec, proto->raw.pkt_len);
23eb6f4d186242 Junfeng Guo 2024-05-27  850  	memcpy(msk_buf, proto->raw.mask, proto->raw.pkt_len);
23eb6f4d186242 Junfeng Guo 2024-05-27  851  
23eb6f4d186242 Junfeng Guo 2024-05-27  852  	hw = &pf->hw;
23eb6f4d186242 Junfeng Guo 2024-05-27  853  
23eb6f4d186242 Junfeng Guo 2024-05-27  854  	/* Get raw profile info via Parser Lib */
23eb6f4d186242 Junfeng Guo 2024-05-27  855  	psr = ice_parser_create(hw);
23eb6f4d186242 Junfeng Guo 2024-05-27  856  	if (IS_ERR(psr)) {
23eb6f4d186242 Junfeng Guo 2024-05-27  857  		status = PTR_ERR(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  858  		goto err_mem_alloc;
23eb6f4d186242 Junfeng Guo 2024-05-27  859  	}
23eb6f4d186242 Junfeng Guo 2024-05-27  860  
23eb6f4d186242 Junfeng Guo 2024-05-27  861  	ice_parser_dvm_set(psr, ice_is_dvm_ena(hw));
23eb6f4d186242 Junfeng Guo 2024-05-27  862  
23eb6f4d186242 Junfeng Guo 2024-05-27  863  	if (ice_get_open_tunnel_port(hw, &udp_port, TNL_VXLAN))
23eb6f4d186242 Junfeng Guo 2024-05-27  864  		ice_parser_vxlan_tunnel_set(psr, udp_port, true);
23eb6f4d186242 Junfeng Guo 2024-05-27  865  
23eb6f4d186242 Junfeng Guo 2024-05-27  866  	status = ice_parser_run(psr, pkt_buf, proto->raw.pkt_len, &rslt);
23eb6f4d186242 Junfeng Guo 2024-05-27  867  	if (status)
23eb6f4d186242 Junfeng Guo 2024-05-27  868  		goto err_parser_destroy;
23eb6f4d186242 Junfeng Guo 2024-05-27  869  
23eb6f4d186242 Junfeng Guo 2024-05-27  870  	if (hw->debug_mask & ICE_DBG_PARSER)
23eb6f4d186242 Junfeng Guo 2024-05-27  871  		ice_parser_result_dump(hw, &rslt);
23eb6f4d186242 Junfeng Guo 2024-05-27  872  
23eb6f4d186242 Junfeng Guo 2024-05-27  873  	conf->prof = kzalloc(sizeof(*conf->prof), GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  874  	if (!conf->prof)
23eb6f4d186242 Junfeng Guo 2024-05-27 @875  		goto err_parser_destroy;

status = -ENOMEM;

23eb6f4d186242 Junfeng Guo 2024-05-27  876  
23eb6f4d186242 Junfeng Guo 2024-05-27  877  	status = ice_parser_profile_init(&rslt, pkt_buf, msk_buf,
23eb6f4d186242 Junfeng Guo 2024-05-27  878  					 proto->raw.pkt_len, ICE_BLK_FD,
23eb6f4d186242 Junfeng Guo 2024-05-27  879  					 conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  880  	if (status)
23eb6f4d186242 Junfeng Guo 2024-05-27  881  		goto err_parser_profile_init;
23eb6f4d186242 Junfeng Guo 2024-05-27  882  
23eb6f4d186242 Junfeng Guo 2024-05-27  883  	if (hw->debug_mask & ICE_DBG_PARSER)
23eb6f4d186242 Junfeng Guo 2024-05-27  884  		ice_parser_profile_dump(hw, conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  885  
23eb6f4d186242 Junfeng Guo 2024-05-27  886  	/* Store raw flow info into @conf */
23eb6f4d186242 Junfeng Guo 2024-05-27  887  	conf->pkt_len = proto->raw.pkt_len;
23eb6f4d186242 Junfeng Guo 2024-05-27  888  	conf->pkt_buf = pkt_buf;
23eb6f4d186242 Junfeng Guo 2024-05-27  889  	conf->parser_ena = true;
23eb6f4d186242 Junfeng Guo 2024-05-27  890  
23eb6f4d186242 Junfeng Guo 2024-05-27  891  	ice_parser_destroy(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  892  	return 0;
23eb6f4d186242 Junfeng Guo 2024-05-27  893  
23eb6f4d186242 Junfeng Guo 2024-05-27  894  err_parser_profile_init:
23eb6f4d186242 Junfeng Guo 2024-05-27  895  	kfree(conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  896  err_parser_destroy:
23eb6f4d186242 Junfeng Guo 2024-05-27  897  	ice_parser_destroy(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  898  err_mem_alloc:
23eb6f4d186242 Junfeng Guo 2024-05-27  899  	kfree(pkt_buf);
23eb6f4d186242 Junfeng Guo 2024-05-27  900  	return status;
23eb6f4d186242 Junfeng Guo 2024-05-27  901  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

