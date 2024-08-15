## Copyright (C) 2024 Walter Hernández Angel
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} conduit_dos (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Walter Hernández Angel w.hernandez.angel@icloud.com
## Created: 2024-08-02

## RMC = Rigid Metal Conduit occupancy as NFPA-70

function rmc
%{
  if (nargin != 2)
    print_usage ();
  elseif
      printf ("El resultado de n x k es: %d\n", n*k)
  endif
%}

  clc;
  clear;
  DI = [16.1, 21.2, 27, 35.4, 41.2, 52.9, 63.2, 78.5, 90.7, 102.9];
  A_DI = pi * (DI/2).^2;
  nombre = "canalizacion.csv";
  ita = "ITEM";
  itb = "NOMBRE";
  itc = "DIAM. EXT.";
  itd = "AREA en mm2";
  ite = "OCUPACION";
  itf = "CAG";
  fid = fopen (nombre, "w");
  fdisp (fid, " ");
  fclose (fid);
  disp ("")
  disp ("Esta funcion calcula el porcentaje de ocupacion\nde un Conduit Rigido RMC segun NEC-70 ")
  disp ("")
  N = input ("Ingrese la cantidad de Conductores: ");
%==================================================================================================
  while (N >= 1)
    disp (" ")


%==================================================================================================
  switch (N)
    case 1
      uno();
    case 2
      dos();
    otherwise
      tres();
  endswitch
  %========================================================================================
function uno
    disp (" ")
    disp ("El porcentaje de ocupacion del conduit NO puede superar el 53%")
    disp ("")
    i = 1;
    fflush (stdout);
    C {i} = input ("Nombre del Circuito: ", "s");
    DE = input ("Ingrese diametro exterior del conductor: ");
    disp (" ")
    ApC = pi * (DE/2)^2;
    ATC = sum (ApC);
    printf ("El Area de %s, es: %d mm2\n", upper(C{i}), ApC)
    disp (" ")
    disp (" ")
    OCUP = 100 * ApC ./ A_DI;
    i = 1;
    while (OCUP (1, i) > 53)
      i++;
    endwhile
    fid = fopen (nombre, "a");
  fdisp (fid, "El porcentaje de ocupacion del conduit NO puede superar el 53%")
  fdisp (fid, " ")
  fprintf (fid, "%5s; %25s; %15s; %15s; %20s; %10s\n", ita, itb, itc, itd, ite, itf)
  fdisp (fid, " ")
  fclose (fid)
endfunction
  %===============================================================================
function dos
    disp (" ")
    disp ("El porcentaje de ocupacion del conduit NO puede superar el 31%")
    disp ("")
    for i = 1:N
      fflush (stdout);
      C {i} = input ("Nombre del Circuito: ", "s");
      printf ("Ingrese diametro %d: ", i)
      DE (1, i) = input (" ");
    endfor

    disp (" ")
    ApC = pi * (DE/2).^2;
    for i = 1 : N
      printf ("El Area de %s, es: %d mm2\n", upper(C{i}), ApC (1, i))
      disp ("")
    endfor
    disp (" ")
    ATC = sum (ApC);
    printf ("El Area Total de Cables es: %d mm2\n", ATC)
    disp (" ")
    OCUP = 100 * ATC ./ A_DI;
    disp (" ")
    i = 1;
    while (OCUP (1, i) > 31)
      i++;
    endwhile
    fid = fopen (nombre, "a");
  fdisp (fid, "El porcentaje de ocupacion del conduit NO puede superar el 31%")
  fdisp (fid, " ")
  fprintf (fid, "%5s; %25s; %15s; %15s; %20s; %10s\n", ita, itb, itc, itd, ite, itf)
  fdisp (fid, " ")
  fclose (fid)
endfunction
%============================================================================
function tres
    disp (" ")
    disp ("El porcentaje de ocupacion del conduit NO puede superar el 40%")
    disp ("")
    for i = 1:N
      fflush (stdout);
      C {i} = input ("Nombre del Circuito: ", "s");
      printf ("Ingrese diametro %d: ", i)
      DE (1, i) = input (" ");
    endfor
    disp (" ")
    ApC = pi * (DE/2).^2;
    for i = 1 : N
      printf ("El Area de %s, es: %d mm2\n", upper(C{i}), ApC (1, i))
      disp ("")
    endfor
    disp (" ")
    ATC = sum (ApC);
    printf ("El Area Total de Cables es: %d mm2\n", ATC)
    disp (" ")
    OCUP = 100 * ATC ./ A_DI;
    disp (" ")
    i = 1;
    while (OCUP (1, i) > 40)
      i++;
    endwhile
      fid = fopen (nombre, "a");
  fdisp (fid, "El porcentaje de ocupacion del conduit NO puede superar el 40%")
  fdisp (fid, " ")
  fprintf (fid, "%5s; %25s; %15s; %15s; %20s; %10s\n", ita, itb, itc, itd, ite, itf)
  fdisp (fid, " ")
  fclose (fid)
endfunction
%===========================================================================

printf ("Porcentaje de conduit ocupado: %d %%\n", OCUP(1, i))
disp (" ")
    switch (i)
      case 1
	disp ("El conduit es de 1/2\"");
	CAG = "1/2\"";
      case 2
	disp ("El conduit es de 3/4\"");
	CAG = "3/4\"";
      case 3
	disp ("El conduit es de 1\"");
	CAG = "1\"";
      case 4
	disp ("El conduit es de 1 1/4\"");
	CAG = "1 1/4\"";
      case 5
	disp ("El conduit es de 1 1/2\"");
	CAG = "1 1/2\"";
      case 6
	disp ("El conduit es de 2\"");
	CAG = "2\"";
      case 7
	disp ("El conduit es de 2 1/2\"");
	CAG = "2 1/2\"";
      case 8
	disp ("El conduit es de 3\"");
	CAG = "3\"";
      case 9
	disp ("El conduit es de 3 1/2\"");
	CAG = "3 1/2\"";
      case 10
	disp ("El conduit es de 4\"");
	CAG = "4\"";
      otherwise
	disp ("Son Demasiados Cables")
  endswitch
    disp ("")
    cont = 1;
    fid = fopen (nombre, "a");
    while (cont <= N)
      fprintf (fid, "Cto_%d; %25s; %15d; %15d\n", cont, upper(C{cont}), DE(cont), ApC(cont));
    cont++;
    endwhile
    fprintf (fid, " \n\n");
    fprintf (fid, " ; ; %44s; %15d; %20d; %10s\n", "TOTALES", ATC, OCUP(1, i), CAG);
    fclose (fid)
    N = input ("Ingrese la cantidad de Conductores: ");
  endwhile
endfunction
