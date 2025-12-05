Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC934DB6A
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919428; cv=none; b=YkGUz0GY4SOsoiICbnKSNOBykYvbqTDVM1c+1O1fcAaFKvhGsz81Avg8Aje/jYn27upmjqOtcDceRtRpq/DuV0htrBov4z+XHxzr+QUq6KF95gMFltDZdt2n/kqDzZetMpxkwIdWaznKtps+vBxcnqadgWG16WCquaQbjlycZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919428; c=relaxed/simple;
	bh=a5w8XstsKjuodEkD8h5eva/LR/9DG4mYKG1tOEooSms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTJTx9zKchLnG52XJXtp/oHxHr8Ff6kTLWktpVRDDLu7G/yaRNa3ruUuow5fZ0B2HldLLRPT7W+eJRdB7k8KRmrEWzn6SXZqZ8ffjhoXJQlFAAgbe5vAgjzPNb8q/z68Cxt44R2gdE+t7ZuN2HcQFFmf4a71P1yCd9LazN4fNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSBYnlvp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSBYnlvp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so21828965e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Dec 2025 23:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919415; x=1765524215; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4/fcNS8kky3Rm+i8WdInM413rzLMh5Uvxb+5uYpuyo=;
        b=MSBYnlvpXvujUMoBUSMjDHcrSTHi2myU/BvwWqX1jTy1iHHltsGXcZUMzlAzqapwAO
         1KhzXcxS2EE4uwVF5x37mtv65q6Xx6CVJaOsmstFzXg7GXtwea6hVjT491PrsCCUSNJr
         meQyfhGJQzLfi6sv4I2c1lgN3Si7B2NFANpnZjxdtT0lrO6Xa8ku5dVhdk7XbLAXWUg/
         QEScESgtLEN1tFuZTvOW1FHce4OmsLomkdrJQzaO0XeDc5R7PmPaNDIYAB1HG5bhSmMk
         Yn+RHzdRrqyXD7GhKIm5+qdmd4wM1JZ8p8VM+j6vVa1ZCsmx7WU6buJ2VQMPZgoow0QI
         V8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919415; x=1765524215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4/fcNS8kky3Rm+i8WdInM413rzLMh5Uvxb+5uYpuyo=;
        b=dbYhpap9jPC4An4U5770laoBzUgvbM9sAZIWOyM6H1XbZXaJK458ngGVs02Ic/V4u+
         Pd+BbW+GTeTUWhXG4d3wNTFu2BIUhpSdLXUnw2Nx16KrFFfmCkVeMLD9TDEhs7bEkQcv
         XUcmX7ZawDllAY7XT7pRXqYLds95cgOmNoqAGhz1gPs1J2lZfChfSQ1kGBaRhcOazjQm
         3R1jkrOlk5lwZVnCebCz/+R3oZu1tNDSQ6/yin9RIIy+ywubixN5o/2+ZybE8unXl1sh
         dybmVEBZPIjpqvRyzy/pLT6eJg/lXVJkBM1LE7PARp8B5ci+XoJBoBIn7feJRvnWE0T2
         jlEg==
X-Gm-Message-State: AOJu0YzT8EhEOOX7rzndhoxO4Skm9i3jnN61abj8ugZJlKCUF5XV/h2h
	+7Pi/qd0pjQAucUdWFwxNsUUF705Yq8F7LLcO9TeP/03NiDrU0A5cjLbVbF07Ki6mPwWURCEprq
	Zb3Pf
X-Gm-Gg: ASbGncvhXh5sbP9ZCnFqbtv/KY1ta5CcGgSHDMRCbjCLCrIqJEY/9uY3kvdhd6NG+7a
	3TdEShSJ+7n9dOsa3Xq1pIVmSXJ1akn/9B3CWUZ8PbeEoMlEamcIYYG3N4WIlEdF4tnoRuGOqGq
	ZD3brwIXz0mEOG/gn0ipXBMIGUFeUqageletSJpOUxaWVbxmg99SdFitorBsxTKJqHhrCcPoABd
	bkTK9NYEYignTlKKCCE3woL1oviXxV7MRV/snyAa+9LoWFQxCUg6ZFaQQH25QhuMtnbN3gUrIEq
	JLE8MOcf78jS2mdN9ZzdFg1K+A3WNPbz0h43w6KkRB6aua0E1JHkrllYsIHYFsNzISGJC6iV48R
	OLWjTuEVsBzhr9fp8ZSnVwUrdpzNnuvWy4Z5k0JLZ26wnBlzwnCdOVcvW1htdvMPxDyWcz9ZdeK
	2mi9EvLMhM0rgAyAFU
X-Google-Smtp-Source: AGHT+IHqi1QpVSllbMiRHNcv1AbXpU4AuCeDaedHZwtKEH/lvnzqXTU1voWQvbkLB812wn0n/39E2w==
X-Received: by 2002:a05:600c:a49:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-4792f38d372mr43114255e9.25.1764919415444;
        Thu, 04 Dec 2025 23:23:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b157783sm60515375e9.5.2025.12.04.23.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:23:34 -0800 (PST)
Date: Fri, 5 Dec 2025 10:23:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>
Subject: [tnguy-next-queue:dev-queue 41/61]
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c:252 idpf_add_flow_steer()
 warn: missing error code 'err'
Message-ID: <202512050309.Jd0nVLZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251205072331.hvVHRWgGy3rE2P8LDrBl8ycshNUqf0geLfRBPXumURQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   b8ceeacaba537294e383161a87e09b939ecd7d1d
commit: f017eeeb027274f63af4d541a315235abf2bc5e9 [41/61] idpf: refactor idpf to use libie control queues
config: s390-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050309.Jd0nVLZj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512050309.Jd0nVLZj-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_ethtool.c:252 idpf_add_flow_steer() warn: missing error code 'err'

vim +/err +252 drivers/net/ethernet/intel/idpf/idpf_ethtool.c

ada3e24b84a097 Ahmed Zaki            2025-04-23  164  static int idpf_add_flow_steer(struct net_device *netdev,
ada3e24b84a097 Ahmed Zaki            2025-04-23  165  			       struct ethtool_rxnfc *cmd)
ada3e24b84a097 Ahmed Zaki            2025-04-23  166  {
ada3e24b84a097 Ahmed Zaki            2025-04-23  167  	struct idpf_fsteer_fltr *fltr, *parent = NULL, *f;
ada3e24b84a097 Ahmed Zaki            2025-04-23  168  	struct idpf_netdev_priv *np = netdev_priv(netdev);
ada3e24b84a097 Ahmed Zaki            2025-04-23  169  	struct idpf_vport_user_config_data *user_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  170  	struct ethtool_rx_flow_spec *fsp = &cmd->fs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  171  	struct virtchnl2_flow_rule_add_del *rule;
ada3e24b84a097 Ahmed Zaki            2025-04-23  172  	struct idpf_vport_config *vport_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  173  	struct virtchnl2_rule_action_set *acts;
ada3e24b84a097 Ahmed Zaki            2025-04-23  174  	struct virtchnl2_flow_rule_info *info;
ada3e24b84a097 Ahmed Zaki            2025-04-23  175  	struct virtchnl2_proto_hdrs *hdrs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  176  	struct idpf_vport *vport;
ada3e24b84a097 Ahmed Zaki            2025-04-23  177  	u32 flow_type, q_index;
ada3e24b84a097 Ahmed Zaki            2025-04-23  178  	u16 num_rxq;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  179  	int err = 0;
ada3e24b84a097 Ahmed Zaki            2025-04-23  180  
ada3e24b84a097 Ahmed Zaki            2025-04-23  181  	vport = idpf_netdev_to_vport(netdev);
ada3e24b84a097 Ahmed Zaki            2025-04-23  182  	vport_config = vport->adapter->vport_config[np->vport_idx];
ada3e24b84a097 Ahmed Zaki            2025-04-23  183  	user_config = &vport_config->user_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  184  	num_rxq = user_config->num_req_rx_qs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  185  
ada3e24b84a097 Ahmed Zaki            2025-04-23  186  	flow_type = fsp->flow_type & ~(FLOW_EXT | FLOW_MAC_EXT | FLOW_RSS);
ada3e24b84a097 Ahmed Zaki            2025-04-23  187  	if (flow_type != fsp->flow_type)
ada3e24b84a097 Ahmed Zaki            2025-04-23  188  		return -EINVAL;
ada3e24b84a097 Ahmed Zaki            2025-04-23  189  
ada3e24b84a097 Ahmed Zaki            2025-04-23  190  	if (!idpf_sideband_action_ena(vport, fsp) ||
ada3e24b84a097 Ahmed Zaki            2025-04-23  191  	    !idpf_sideband_flow_type_ena(vport, flow_type))
ada3e24b84a097 Ahmed Zaki            2025-04-23  192  		return -EOPNOTSUPP;
ada3e24b84a097 Ahmed Zaki            2025-04-23  193  
ada3e24b84a097 Ahmed Zaki            2025-04-23  194  	if (user_config->num_fsteer_fltrs > idpf_fsteer_max_rules(vport))
ada3e24b84a097 Ahmed Zaki            2025-04-23  195  		return -ENOSPC;
ada3e24b84a097 Ahmed Zaki            2025-04-23  196  
ada3e24b84a097 Ahmed Zaki            2025-04-23  197  	q_index = fsp->ring_cookie;
ada3e24b84a097 Ahmed Zaki            2025-04-23  198  	if (q_index >= num_rxq)
ada3e24b84a097 Ahmed Zaki            2025-04-23  199  		return -EINVAL;
ada3e24b84a097 Ahmed Zaki            2025-04-23  200  
ada3e24b84a097 Ahmed Zaki            2025-04-23  201  	rule = kzalloc(struct_size(rule, rule_info, 1), GFP_KERNEL);
ada3e24b84a097 Ahmed Zaki            2025-04-23  202  	if (!rule)
ada3e24b84a097 Ahmed Zaki            2025-04-23  203  		return -ENOMEM;
ada3e24b84a097 Ahmed Zaki            2025-04-23  204  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  205  	fltr = kzalloc(sizeof(*fltr), GFP_KERNEL);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  206  	if (!fltr) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  207  		err = -ENOMEM;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  208  		goto out_free_rule;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  209  	}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  210  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  211  	/* detect duplicate entry and reject before adding rules */
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  212  	spin_lock_bh(&vport_config->flow_steer_list_lock);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  213  	list_for_each_entry(f, &user_config->flow_steer_list, list) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  214  		if (f->fs.location == fsp->location) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  215  			err = -EEXIST;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  216  			break;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  217  		}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  218  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  219  		if (f->fs.location > fsp->location)
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  220  			break;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  221  		parent = f;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  222  	}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  223  	spin_unlock_bh(&vport_config->flow_steer_list_lock);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  224  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  225  	if (err)
f017eeeb027274 Pavan Kumar Linga     2025-11-17  226  		goto out_free_fltr;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  227  
ada3e24b84a097 Ahmed Zaki            2025-04-23  228  	rule->vport_id = cpu_to_le32(vport->vport_id);
ada3e24b84a097 Ahmed Zaki            2025-04-23  229  	rule->count = cpu_to_le32(1);
ada3e24b84a097 Ahmed Zaki            2025-04-23  230  	info = &rule->rule_info[0];
ada3e24b84a097 Ahmed Zaki            2025-04-23  231  	info->rule_id = cpu_to_le32(fsp->location);
ada3e24b84a097 Ahmed Zaki            2025-04-23  232  
ada3e24b84a097 Ahmed Zaki            2025-04-23  233  	hdrs = &info->rule_cfg.proto_hdrs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  234  	hdrs->tunnel_level = 0;
ada3e24b84a097 Ahmed Zaki            2025-04-23  235  	hdrs->count = cpu_to_le32(2);
ada3e24b84a097 Ahmed Zaki            2025-04-23  236  
ada3e24b84a097 Ahmed Zaki            2025-04-23  237  	acts = &info->rule_cfg.action_set;
ada3e24b84a097 Ahmed Zaki            2025-04-23  238  	acts->count = cpu_to_le32(1);
ada3e24b84a097 Ahmed Zaki            2025-04-23  239  	acts->actions[0].action_type = cpu_to_le32(VIRTCHNL2_ACTION_QUEUE);
ada3e24b84a097 Ahmed Zaki            2025-04-23  240  	acts->actions[0].act_conf.q_id = cpu_to_le32(q_index);
ada3e24b84a097 Ahmed Zaki            2025-04-23  241  
ada3e24b84a097 Ahmed Zaki            2025-04-23  242  	switch (flow_type) {
ada3e24b84a097 Ahmed Zaki            2025-04-23  243  	case UDP_V4_FLOW:
ada3e24b84a097 Ahmed Zaki            2025-04-23  244  		idpf_fsteer_fill_ipv4(hdrs, fsp);
ada3e24b84a097 Ahmed Zaki            2025-04-23  245  		idpf_fsteer_fill_udp(hdrs, fsp, true);
ada3e24b84a097 Ahmed Zaki            2025-04-23  246  		break;
ada3e24b84a097 Ahmed Zaki            2025-04-23  247  	case TCP_V4_FLOW:
ada3e24b84a097 Ahmed Zaki            2025-04-23  248  		idpf_fsteer_fill_ipv4(hdrs, fsp);
ada3e24b84a097 Ahmed Zaki            2025-04-23  249  		idpf_fsteer_fill_tcp(hdrs, fsp, true);
ada3e24b84a097 Ahmed Zaki            2025-04-23  250  		break;
02cbfba1add5bd Alan Brady            2023-08-07  251  	default:
f017eeeb027274 Pavan Kumar Linga     2025-11-17 @252  		goto out_free_fltr;

err = -EINVAL, plz.

ada3e24b84a097 Ahmed Zaki            2025-04-23  253  	}
ada3e24b84a097 Ahmed Zaki            2025-04-23  254  
ada3e24b84a097 Ahmed Zaki            2025-04-23  255  	err = idpf_add_del_fsteer_filters(vport->adapter, rule,
ada3e24b84a097 Ahmed Zaki            2025-04-23  256  					  VIRTCHNL2_OP_ADD_FLOW_RULE);
f017eeeb027274 Pavan Kumar Linga     2025-11-17  257  	if (err || info->status != cpu_to_le32(VIRTCHNL2_FLOW_RULE_SUCCESS)) {
f017eeeb027274 Pavan Kumar Linga     2025-11-17  258  		/* virtchnl2 rule is already consumed */
f017eeeb027274 Pavan Kumar Linga     2025-11-17  259  		kfree(fltr);
f017eeeb027274 Pavan Kumar Linga     2025-11-17  260  		return err;

Should this be:

	return err ?: -EINVAL;

ada3e24b84a097 Ahmed Zaki            2025-04-23  261  	}
ada3e24b84a097 Ahmed Zaki            2025-04-23  262  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  263  	/* Save a copy of the user's flow spec so ethtool can later retrieve it */
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  264  	fltr->fs = *fsp;
ada3e24b84a097 Ahmed Zaki            2025-04-23  265  
61022f50353bc8 Sreedevi Joshi        2025-09-30  266  	spin_lock_bh(&vport_config->flow_steer_list_lock);
ada3e24b84a097 Ahmed Zaki            2025-04-23  267  	parent ? list_add(&fltr->list, &parent->list) :
ada3e24b84a097 Ahmed Zaki            2025-04-23  268  		 list_add(&fltr->list, &user_config->flow_steer_list);
ada3e24b84a097 Ahmed Zaki            2025-04-23  269  
ada3e24b84a097 Ahmed Zaki            2025-04-23  270  	user_config->num_fsteer_fltrs++;
61022f50353bc8 Sreedevi Joshi        2025-09-30  271  	spin_unlock_bh(&vport_config->flow_steer_list_lock);
02cbfba1add5bd Alan Brady            2023-08-07  272  
f017eeeb027274 Pavan Kumar Linga     2025-11-17  273  	return 0;
f017eeeb027274 Pavan Kumar Linga     2025-11-17  274  
f017eeeb027274 Pavan Kumar Linga     2025-11-17  275  out_free_fltr:
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  276  	kfree(fltr);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  277  out_free_rule:
ada3e24b84a097 Ahmed Zaki            2025-04-23  278  	kfree(rule);
ada3e24b84a097 Ahmed Zaki            2025-04-23  279  	return err;
ada3e24b84a097 Ahmed Zaki            2025-04-23  280  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

