Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55920DD48
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041532; cv=none; b=R0Km+rOCT2Cag2MYqfSJsrLSvyorfrpcYtFkgrMidL7dy4Z47QWN8HCmCzb2YKg9ebFG6mxHiC3CcThC8Z+qkC1Ww3wQIEWuJyjAWxOMeEMDNPdqdQ9EOCoiyqr5yoFZjUdIZCThbMyZKSP6W9dRRmc5aMGXPmNX6e9/q2uHD8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041532; c=relaxed/simple;
	bh=jeGPhNX3TRiq6YzX9ol22Y+2GlfVWu1RumkkCJ2pxKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsXOGzZdk0SyGfMavE9gphwuJxruCZf/gCv7RUND+U4vx4Ve2x/o5GJfcmkq7Xe5OLxLvct2LvGAjf9V8uwrovfnuvz8LSVpbZFfheQphRvhxSV4p/ViJhSVyvDwUYABAuta6GgCgsBgLbzmSYizKNZivn0BD/y4EaMzluYSNRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FMAR6qIZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FMAR6qIZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so95720f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766041529; x=1766646329; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArDYjTNEnUF4IGjgL6stzEBCxqWfodJ5gdRYTtvI4IY=;
        b=FMAR6qIZto2RiKerUd4QrEmu/1INpF1uyACFvWO/tLMUbv5EXYa3zntuDcYC4ZV1hC
         iPQp1epTfIiuCkTabSHUYE35v6t6MleIcncERdNk/nWU2KPKzEvQiupGl6wb2aAK0W94
         Ri7yMdpUXsoOg+1950KhMnNExtD0i0Qdh8IJ/Rs4EsKWQSCfyUQdORucUOp3xJwCNVFr
         273FEPFDspYW1h1X1iFM5TEmw9EsH64AzJbsglqaMzgn1x1gobVt4W/yVdF22dSWGIJU
         v4xAaY/CLahO53ZW3kBP23TRfpARss4lGvx2Vd8ge3iWq6EK0Ds8u30+rCQnyatR3Vi5
         PUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041529; x=1766646329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArDYjTNEnUF4IGjgL6stzEBCxqWfodJ5gdRYTtvI4IY=;
        b=Lx+oyzpJnpo+bXsPjmZTlYaa0EMeF2bohJ25bVdhBjIP/dcqtFSO0j4H2hVeMiY8tH
         MNm8oHTYe5xDUefkS8MXofJuMINX13MKPmhBzrR1tEbOdQVALnkz7ruPw5gDXmT+gosK
         IFk0vId2B9kNdd8h0gQz34fh8adR9g8qcHwoU4PnzRRejZD5BBmmbfaO6cmaHBAnJJgE
         gKA/JyQtO9VpwZPl7as1fN7IZhwsHboPsdfnZKd68g9o7fe4ZGasar+5ujJmmRofJrJ1
         iE2PTPuGpPKedY21Ea1oMH2m5O0DmlBhovTHUzPzqE3ZUgNa1RmcC3eq38mUEfZ31hEF
         sPnw==
X-Gm-Message-State: AOJu0YzJV+ovv6v6LAnDl4rYz1KpftyOkFoS+dAas8UNCYNnB04qH1EL
	zrs78duHXgnfgR/nh2QdLsAxavlazOvFzD0bA6CQo7PX3a4AIxBoroK0fHlZ9pYiP+YbvdU6Nfh
	9AFX4
X-Gm-Gg: AY/fxX5GsYuL3MpinpclLXDakz6cJfigwlsVqq5hJvV4nBPuF9bOx3MJ6/ayu1XkBla
	x2qb2o2q4GTqC5E5UKwESuOtZgmjzRClhEs+gY+jQ78r6d+iGc1MvT25iW65UiHEM9QDGwl3I1G
	WOBYpHK7YRIDnqt/br42IvNOcIJE9j4+H5ZH4g9KvnwzYETfKg5M8T9fX4sjowu+ELLS88ayEC8
	7IKUXNfx7k8M26BFxZJvq+4Mphe/4XnIFUe5P9oBu/hTs+ZBKRlYorm2oE9Na08ZetyZvQ6R77p
	IhP8jNEaq0uio8xzJGzbdAnr7gsFohNUrCDI52L8JvVubRUboJgarEN117uz8vZrJZ3NHnDwx01
	99DzT6IQNdfNY0JHaU5lbrCAV9Aixb94RzEDFRPxRN3EddlhDDgd2Txcla8IQulm+oBykwI8NZU
	zg28FbfoocynScjWZE
X-Google-Smtp-Source: AGHT+IGKNeIi233kyv1f0hD/iKruunS7x30uHwMXq0eSJaZQnV0D/eoFKL6iRVudXOeGP+Bn3B5+rw==
X-Received: by 2002:a05:6000:2083:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-430fc3afd23mr16948339f8f.15.1766041528550;
        Wed, 17 Dec 2025 23:05:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244940148sm3394185f8f.15.2025.12.17.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:05:28 -0800 (PST)
Date: Thu, 18 Dec 2025 10:05:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Parav Pandit <parav@nvidia.com>, Feng Liu <feliu@nvidia.com>,
	William Tu <witu@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981
 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'
Message-ID: <202512180851.WNLFBz7t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251218070524.FebQhUH5G4PhhwyhRJ75HscbrV2YY4p6Fe31UGleFcQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 1baf30426553efb3ac518b0e9d5c1c3f8ed7762a net/mlx5: E-Switch, Set/Query hca cap via vhca id
config: alpha-randconfig-r073-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180851.WNLFBz7t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512180851.WNLFBz7t-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-45)'

vim +981 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

1baf30426553efb Saeed Mahameed 2025-06-16  978  static inline bool
1baf30426553efb Saeed Mahameed 2025-06-16  979  mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
1baf30426553efb Saeed Mahameed 2025-06-16  980  {
1baf30426553efb Saeed Mahameed 2025-06-16 @981  	return -EOPNOTSUPP;

This should be either true or false since it's a bool function.

1baf30426553efb Saeed Mahameed 2025-06-16  982  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

