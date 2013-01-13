\NeedsTeXFormat{LaTeX2e}
 
\ProvidesClass{Tamriel}[2007/09/19 Classe personnelle, V1.0]
 
% *************************************************
%                    classe de base
% *************************************************
\LoadClass[a4paper, 8pt]{report}

% *************************************************
%                    extensions
% *************************************************
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
% ****** Police par défaut
\usepackage{libris}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[normalem]{ulem}
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage{lastpage}
\RequirePackage{makeidx}
\RequirePackage[frenchb]{babel}
% ****** Pour mettre des puces à la place des tirets dans les listes
\renewcommand{\FrenchLabelItem}{\textbullet}
\RequirePackage{verbatim}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{url}
% ******* Définition des marges *********
\RequirePackage[margin=1.6cm]{geometry}
% ******* Entete et pied de pages *********
\RequirePackage{fancyhdr}
% ******* Bordure autour de la page *********
\RequirePackage[absolute]{textpos}
% ******* Boîtes arrondies *******
\RequirePackage{fancybox}

%-------------PDF-------------------------------------------------------------
 
%Passage au PDF de qualité
\usepackage[pdftex, % Paramétrage de la navigation
    bookmarks = true, % Signets
    bookmarksnumbered = true, % Signets numérotés
    pdfpagemode = true, % Signets/vignettes fermé à l'ouverture
    pdfstartview = FitH, % La page prend toute la largeur
    pdfpagelayout = TwoColumn, % Vue par page
    colorlinks = false, % Liens en couleur
    urlcolor = purple, % Couleur des liens externes
    pdfborder = {0 0 0} % Style de bordure : ici, rien
    ]{hyperref}% % Utilisation de HyperTeX
 
\hypersetup{ % Information sur le document
    pdfauthor = {Segle}, % Auteurs
    pdftitle = {The Elder Scrolls - Tamriel}, % Titre du document
    pdfsubject = {}, % Sujet
    pdfkeywords = {}, % Mots-clefs
    pdfcreator = {PdfLatex}, % Logiciel qui a crée le document
    pdfproducer = {} % Personne/Société qui a produit le pdf
    plainpages = true}

% *************************************************
%                    Mise en forme
%                Du titre du Document
% *************************************************    
\renewcommand{\maketitle}{
  \null
  \thispagestyle{empty}%
  \vfill
  \begin{center}\leavevmode
    \normalfont
    {\LARGE \@title\par}%
    \vskip 1cm
    {\Large \@author\par}%
    \vskip 1cm
    {Version du \@date\par}%
  \end{center}%
  \vfill
  \null
  \cleardoublepage
}

% *************************************************
%             Espacement des paragraphes
%                  et interlignes
% *************************************************
\setlength{\parskip}{1.5ex plus .7ex minus .7ex}
\renewcommand{\baselinestretch}{1.2}

% *************************************************
%             Entête de Chapitre
% *************************************************
\renewcommand{\chapter} {      	   % Starts new page.
   \thispagestyle{plain}           % Page style of chapter page is 'plain'
   \global\@topnum\z@              % Prevents figures from going at top of page.
   \@afterindenttrue               % Inserts indent in first paragraph.  Change
   \secdef\@chapter\@schapter}     % to \@afterindentfalse to remove indent.

\@addtoreset{chapter}{part}
    
\renewcommand{\@makechapterhead}[1] {    
	% Heading for \chapter command
  	{ 	
  		\vskip 15pt  
  		\parindent 0pt \centering   
    	\ifnum \c@secnumdepth >\m@ne         		% IF secnumdepth > -1 THEN
      	\makebox[450pt]{
      	    \raisebox{-1.8ex}{
      	        \includegraphics[scale=0.15]{../MEP/chapitre_gauche}
      	        }
      	    \hspace{0.0ex plus .3ex minus .2ex}
      		\textcolor{black}{
      			\large\bf \textsc{Chapitre \thechapter}
      			\hspace{0.0ex plus .3ex minus .2ex} :  % Space between number and the ":".
  				\hspace{0.0ex plus .2ex minus .2ex}  \fi    % Space between ":" and title
    			\large \bf
    			\textsc{#1}									% Title.
	    	}
	    	\hspace{0.0ex plus .3ex minus .2ex}
	    	\raisebox{-1.8ex}{
	    	    \includegraphics[scale=0.15]{../MEP/chapitre_droite}
	        }
	    }
	    \par	
	    \nobreak 								% TeX penalty to prevent page break.
    	\vskip 15pt                          		% Space between title and text.
  	} 
}

\renewcommand{\@makeschapterhead}[1] {    
	% Heading for \chapter* command
  	{ 	
  		\vskip 15pt  
  		\parindent 0pt \centering   
  		\textsc{\huge \bf #1}
  		\par	
	    \nobreak 								% TeX penalty to prevent page break.
    	\vskip 15pt                          		% Space between title and text.
  	} 
}
% *************************************************
%             Entête de Section
% *************************************************
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
             {-3.5ex \@plus -1ex \@minus -.2ex}%
             {2.3ex \@plus-.2ex}%
             {\bf\large\textsc}}

% *************************************************
%            Définition des zones exemples
% *************************************************
\definecolor{gris25}{rgb}{0.85,0.85,0.85}
\definecolor{vert15}{rgb}{0.90,0.99,0.90}
\definecolor{rouge15}{rgb}{0.99,0.90,0.90}
\definecolor{jaune15}{rgb}{0.99,0.99,0.69}
\definecolor{bleu15}{rgb}{0.79,0.89,0.99}

\newcommand{\minititre}[1] {
    \parbox{400pt}{
        \vskip -25pt
        \begin{center}
            \textbf {
                #1
            }
        \end{center}    
        \par
    }
}
             
\newcommand{\exemple}[2] {
        \vskip 15pt 
      	\ovalbox{
            \parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{../MEP/exemple.png} 
                }
                % On remonte le titre de l'encadré
                \vskip -40pt 
                \minititre {
                    #1
                }
                % Et on remonte un peu le contenu, mais pas trop
                \vskip 5pt       
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
    	    }		
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones idée scénario
% *************************************************

\newcommand{\scenario}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{../MEP/idee.png} 
                } 
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones notes de conceptions
% *************************************************
             
\newcommand{\note}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{../MEP/note_conception.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones option
% *************************************************
             
\newcommand{\option}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{../MEP/option.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones remarque
% *************************************************
             
\newcommand{\remarque}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[390pt][r]{
                    \includegraphics[scale=0.35]{../MEP/remarque.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des
%       Entête et pied de page
% *************************************************
\fancypagestyle{plain}{%
	\fancyhf{}
    \lhead{
        \begin{textblock*}{0.1cm}(1mm,1mm) 
        \includegraphics[scale=0.45]{../MEP/tamriel_haut_gauche} 
        \end{textblock*} 
    }
    \rhead{
        \begin{textblock*}{0.1cm}(13.8cm,1mm) 
        \includegraphics[scale=0.45]{../MEP/tamriel_haut_droite} 
        \end{textblock*} 
    }
    \chead{\textsc{The Elder Scrolls - Tamriel}}
    \cfoot{
    }     
    \lfoot{
        \begin{textblock*}{0.1cm}(1mm,25.15cm) 
        \includegraphics[scale=0.45]{../MEP/tamriel_bas_gauche} 
        \end{textblock*} 
    }
    \rfoot{
        \begin{textblock*}{0.1cm}(13.8cm,25.15cm) 
        \includegraphics[scale=0.45]{../MEP/tamriel_bas_droite} 
        \end{textblock*} 
    }
	\renewcommand{\headrulewidth}{0pt}  
	\renewcommand{\footrulewidth}{0pt}}  

\setlength{\columnsep}{2pc}
\setlength{\columnseprule}{1px}

\pagestyle{plain}
