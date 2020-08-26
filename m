Content-Type: multipart/mixed; boundary="===============3460861003903918548=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/3] iommu/vt-d:Add support for detecting ACPI device in RMRR
Date: Wed, 26 Aug 2020 13:54:05 +0300
Message-ID: <20200826105404.GZ5493@kadam>
In-Reply-To: <20200826102752.3776-2-FelixCui-oc@zhaoxin.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3460861003903918548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 06:27:50AM -0400, FelixCuioc wrote:
> Some ACPI devices need to issue dma requests to access
> the reserved memory area.BIOS uses the device scope type
> ACPI_NAMESPACE_DEVICE in RMRR to report these ACPI devices.
> This patch add support for detecting ACPI devices in RMRR.
> =

> Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
> ---
>  drivers/iommu/intel/dmar.c  | 74 ++++++++++++++++++++-----------------
>  drivers/iommu/intel/iommu.c | 22 ++++++++++-
>  include/linux/dmar.h        | 12 +++++-
>  3 files changed, 72 insertions(+), 36 deletions(-)
> =

> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 93e6345f3414..024ca38dba12 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -215,7 +215,7 @@ static bool dmar_match_pci_path(struct dmar_pci_notif=
y_info *info, int bus,
>  }
>  =

>  /* Return: > 0 if match found, 0 if no match found, < 0 if error happens=
 */
> -int dmar_insert_dev_scope(struct dmar_pci_notify_info *info,
> +int dmar_pci_insert_dev_scope(struct dmar_pci_notify_info *info,
>  			  void *start, void*end, u16 segment,
>  			  struct dmar_dev_scope *devices,
>  			  int devices_cnt)
> @@ -304,7 +304,7 @@ static int dmar_pci_bus_add_dev(struct dmar_pci_notif=
y_info *info)
>  =

>  		drhd =3D container_of(dmaru->hdr,
>  				    struct acpi_dmar_hardware_unit, header);
> -		ret =3D dmar_insert_dev_scope(info, (void *)(drhd + 1),
> +		ret =3D dmar_pci_insert_dev_scope(info, (void *)(drhd + 1),
>  				((void *)drhd) + drhd->header.length,
>  				dmaru->segment,
>  				dmaru->devices, dmaru->devices_cnt);
> @@ -696,48 +696,56 @@ dmar_find_matched_drhd_unit(struct pci_dev *dev)
>  =

>  	return dmaru;
>  }
> -
> -static void __init dmar_acpi_insert_dev_scope(u8 device_number,
> -					      struct acpi_device *adev)
> +int dmar_acpi_insert_dev_scope(u8 device_number,

The patch deleted the blank line between functions.  Make this function
bool, change the 1/0 to true/false.  Add a comment explaining what the
return values mean.

> +				struct acpi_device *adev,
> +				void *start, void *end,
> +				struct dmar_dev_scope *devices,
> +				int devices_cnt)
>  {
> -	struct dmar_drhd_unit *dmaru;
> -	struct acpi_dmar_hardware_unit *drhd;
>  	struct acpi_dmar_device_scope *scope;
>  	struct device *tmp;
>  	int i;
>  	struct acpi_dmar_pci_path *path;
>  =

> +	for (; start < end; start +=3D scope->length) {
> +		scope =3D start;

Are we sure that there is enough space for sizeof(*scope) in end - start?
(I don't know this code so maybe we are).

> +		if (scope->entry_type !=3D ACPI_DMAR_SCOPE_TYPE_NAMESPACE)
> +			continue;
> +		if (scope->enumeration_id !=3D device_number)
> +			continue;
> +		path =3D (void *)(scope + 1);
> +		for_each_dev_scope(devices, devices_cnt, i, tmp)
> +			if (tmp =3D=3D NULL) {
> +				devices[i].bus =3D scope->bus;
> +				devices[i].devfn =3D PCI_DEVFN(path->device, path->function);
> +				rcu_assign_pointer(devices[i].dev,
> +						   get_device(&adev->dev));
> +				return 1;
> +			}
> +		WARN_ON(i >=3D devices_cnt);
> +	}
> +	return 0;
> +}
> +static int dmar_acpi_bus_add_dev(u8 device_number, struct acpi_device *a=
dev)
> +{
> +	struct dmar_drhd_unit *dmaru;
> +	struct acpi_dmar_hardware_unit *drhd;
> +	int ret =3D 0;

This initialization is never used.

> +
>  	for_each_drhd_unit(dmaru) {
>  		drhd =3D container_of(dmaru->hdr,
>  				    struct acpi_dmar_hardware_unit,
>  				    header);
> +		ret =3D dmar_acpi_insert_dev_scope(device_number, adev, (void *)(drhd+=
1),
> +						((void *)drhd)+drhd->header.length,
> +						dmaru->devices, dmaru->devices_cnt);
> +		if (ret)
> +			break;
> +	}
> +	ret =3D dmar_rmrr_add_acpi_dev(device_number, adev);

What about if dmar_acpi_insert_dev_scope() always returns zero, do we
still want to call dmar_rmrr_add_acpi_dev()?

>  =

> -		for (scope =3D (void *)(drhd + 1);
> -		     (unsigned long)scope < ((unsigned long)drhd) + drhd->header.lengt=
h;
> -		     scope =3D ((void *)scope) + scope->length) {
> -			if (scope->entry_type !=3D ACPI_DMAR_SCOPE_TYPE_NAMESPACE)
> -				continue;
> -			if (scope->enumeration_id !=3D device_number)
> -				continue;
> +	return ret;
>  =

> -			path =3D (void *)(scope + 1);
> -			pr_info("ACPI device \"%s\" under DMAR at %llx as %02x:%02x.%d\n",
> -				dev_name(&adev->dev), dmaru->reg_base_addr,
> -				scope->bus, path->device, path->function);
> -			for_each_dev_scope(dmaru->devices, dmaru->devices_cnt, i, tmp)
> -				if (tmp =3D=3D NULL) {
> -					dmaru->devices[i].bus =3D scope->bus;
> -					dmaru->devices[i].devfn =3D PCI_DEVFN(path->device,
> -									    path->function);
> -					rcu_assign_pointer(dmaru->devices[i].dev,
> -							   get_device(&adev->dev));
> -					return;
> -				}
> -			BUG_ON(i >=3D dmaru->devices_cnt);
> -		}
> -	}
> -	pr_warn("No IOMMU scope found for ANDD enumeration ID %d (%s)\n",
> -		device_number, dev_name(&adev->dev));
>  }
>  =

>  static int __init dmar_acpi_dev_scope_init(void)
> @@ -766,7 +774,7 @@ static int __init dmar_acpi_dev_scope_init(void)
>  				       andd->device_name);
>  				continue;
>  			}
> -			dmar_acpi_insert_dev_scope(andd->device_number, adev);
> +			dmar_acpi_bus_add_dev(andd->device_number, adev);
>  		}
>  	}
>  	return 0;
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index ca557d351518..f774ef63d473 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4507,6 +4507,24 @@ int dmar_find_matched_atsr_unit(struct pci_dev *de=
v)
>  =

>  	return ret;
>  }
> +int dmar_rmrr_add_acpi_dev(u8 device_number, struct acpi_device *adev)

Please add a blank line between functions.
> +{
> +	int ret;
> +	struct dmar_rmrr_unit *rmrru;
> +	struct acpi_dmar_reserved_memory *rmrr;
> +
> +	list_for_each_entry(rmrru, &dmar_rmrr_units, list) {
> +		rmrr =3D container_of(rmrru->hdr,
> +				struct acpi_dmar_reserved_memory,
> +				header);
> +		ret =3D dmar_acpi_insert_dev_scope(device_number, adev, (void *)(rmrr =
+ 1),
> +						((void *)rmrr) + rmrr->header.length,
> +						rmrru->devices, rmrru->devices_cnt);
> +		if (ret)
> +			break;
> +	}
> +	return 0;
> +}

regards,
dan carpenter

--===============3460861003903918548==--

