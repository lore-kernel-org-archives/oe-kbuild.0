Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A113DBB1;
	Tue, 23 Apr 2024 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713898610; cv=none; b=aqvsRY8HhJOph5Xc/d0bjLaviV1+Iss7aQdSvqSCdXEPe9MAe6misjgW2IlUl1h5Bzx1bBW7rewLKGrHN9383MW+Rizvobp7nFfR9xGgTba2G9syKNm6ugcwaF24Z7/EJCHqt7l4jQf6A1bIikHdzKfZsFVsacqztiCdLQpnHbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713898610; c=relaxed/simple;
	bh=vog+q/N0E/087HQu1LzIR2SpjU5cT5FU3jNFHST+SMo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=FD/SzliiJvtzbofZXd13cCQ7zm9E9beSuqGE7kvrTtU+aIAfW1dXw1u/VgqkTTgWlkvZoxhUs33qKkawydMshp15/fOZa07z5RTyrbrV566qhn4Q/Yv/7RlerbsdoiXRJoKIaHLKh3SC1tsFMX62jGfNMGY3+SQIHLSwaYhBSXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbvhvlDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbvhvlDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FB5C116B1;
	Tue, 23 Apr 2024 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713898609;
	bh=vog+q/N0E/087HQu1LzIR2SpjU5cT5FU3jNFHST+SMo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WbvhvlDM/JLSDCgLcq9M6lbCn5LtsQD0OUbSftQ+rDT6qN7TYcR0QTXBxtCTvP9pD
	 sfsD5H2m8FUXUjHDb5khZxKW8fVZua0QJQoXPpr7srACn6Csh2jCD/P4bhdraTXnH5
	 j96mVdW8MUjr3FQKIv1XFBDfuZx23IiWtkemPo7T2Wnx3kYVjDcmMbfJoD32KLzJ0x
	 3XQCIoXLUYkh+0j93QgoiwiEoW6sBkCqYwqtH5o803J+/DxYAEtvOUBuZNkAlbL3hs
	 6zr9v+xUB6GvduObWdlQ8At9F5WfRcfx9Gxd/pSY2mTGc9B6ckNhDdqNIs+QAZdYDL
	 y/NL73eNaFXxA==
Message-ID: <d29701ca636d0bdd8f3c2222aec134c7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a1b833a4-435a-411d-ba4e-b77f5ba9fd94@moroto.mountain>
References: <a1b833a4-435a-411d-ba4e-b77f5ba9fd94@moroto.mountain>
Subject: Re: [linux-next:master 6954/7322] drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.
From: Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, Neil Armstrong <neil.armstrong@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Date: Tue, 23 Apr 2024 11:56:47 -0700
User-Agent: alot/0.10

Quoting Dan Carpenter (2024-04-22 06:56:07)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   f529a6d274b3b8c75899e949649d231298f30a32
> commit: ee2098c0b512fb80b63119199938ea62a240ebc7 [6954/7322] spmi: pmic-a=
rb: Add multi bus support
> config: openrisc-randconfig-r071-20240422 (https://download.01.org/0day-c=
i/archive/20240422/202404221945.jickYhnO-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202404221945.jickYhnO-lkp@intel.com/

Thanks

>=20
> New smatch warnings:
> drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: u=
ninitialized symbol 'ret'.
>=20
> Old smatch warnings:
> drivers/spmi/spmi-pmic-arb.c:1724 spmi_pmic_arb_bus_init() warn: unsigned=
 'irq' is never less than zero.
>=20
> vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c
>=20
> ee2098c0b512fb Abel Vesa 2024-04-17  1762  static int spmi_pmic_arb_regis=
ter_buses(struct spmi_pmic_arb *pmic_arb,
> ee2098c0b512fb Abel Vesa 2024-04-17  1763                                =
       struct platform_device *pdev)
> ee2098c0b512fb Abel Vesa 2024-04-17  1764  {
> ee2098c0b512fb Abel Vesa 2024-04-17  1765       struct device *dev =3D &p=
dev->dev;
> ee2098c0b512fb Abel Vesa 2024-04-17  1766       struct device_node *node =
=3D dev->of_node;
> ee2098c0b512fb Abel Vesa 2024-04-17  1767       struct device_node *child;
> ee2098c0b512fb Abel Vesa 2024-04-17  1768       int ret;
> ee2098c0b512fb Abel Vesa 2024-04-17  1769 =20
> ee2098c0b512fb Abel Vesa 2024-04-17  1770       /* legacy mode doesn't pr=
ovide child node for the bus */
> ee2098c0b512fb Abel Vesa 2024-04-17  1771       if (of_device_is_compatib=
le(node, "qcom,spmi-pmic-arb"))
> ee2098c0b512fb Abel Vesa 2024-04-17  1772               return spmi_pmic_=
arb_bus_init(pdev, node, pmic_arb);
> ee2098c0b512fb Abel Vesa 2024-04-17  1773 =20
> ee2098c0b512fb Abel Vesa 2024-04-17  1774       for_each_available_child_=
of_node(node, child) {
> ee2098c0b512fb Abel Vesa 2024-04-17  1775               if (of_node_name_=
eq(child, "spmi")) {
>=20
> Smatch is complaining that maybe spmi is never found.
>=20
> ee2098c0b512fb Abel Vesa 2024-04-17  1776                       ret =3D s=
pmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> ee2098c0b512fb Abel Vesa 2024-04-17  1777                       if (ret)
> ee2098c0b512fb Abel Vesa 2024-04-17  1778                               r=
eturn ret;
> ee2098c0b512fb Abel Vesa 2024-04-17  1779               }
> ee2098c0b512fb Abel Vesa 2024-04-17  1780       }
> ee2098c0b512fb Abel Vesa 2024-04-17  1781 =20
> ee2098c0b512fb Abel Vesa 2024-04-17 @1782       return ret;

Seems like we should simply return 0 here.
